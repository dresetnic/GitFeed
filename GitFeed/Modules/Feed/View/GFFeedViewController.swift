//
//  FeedGFFeedViewController.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit
import SnapKit
import CRRefresh

class FeedViewController: UIViewController, FeedViewInput {
    
    var output: FeedViewOutput!
    
    var allEvents = [GFEvent]()
    
    var tableView = UITableView()
    
    var lastSelectedIdx = -1
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.output.didAppear()
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.output.didDisappear()
        
        if lastSelectedIdx >= 0 {
            tableView.deselectRow(at: IndexPath(row: lastSelectedIdx, section: 0), animated: true)
        }
    }
    
    // MARK: FeedViewInput
    func setupInitialState() {
        self.addSubviews()
        self.setupConstraints()
        self.setupViews()
    }
    
    func addSubviews(){
        self.view.addSubview(tableView)
    }
    
    func setupConstraints(){
        tableView.snp.makeConstraints { (make) in
            make.center.size.equalToSuperview()
        }
    }
    
    func setupViews(){
        self.title = "Git Feed"
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(GFFeedTableViewCell.self, forCellReuseIdentifier: GFFeedTableViewCell.rIdf)
        self.tableView.cr.addHeadRefresh(animator: FastAnimator()) { [weak self] in
            self?.output.triggeredPullDownToRefresh()
        }
        self.tableView.cr.addFootRefresh(animator: FastAnimator()) {[weak self] in
            self?.output.triggeredPullUpToGetMore()
        }
    }
    
    //MARK: Protocol
    func showEvents(events: [GFEvent]){
        self.allEvents = events
        tableView.reloadData()
    }
    
    func stopHeaderRefreshWith(_ events:[GFEvent]){
        self.allEvents = events
        self.tableView.reloadData()
        self.tableView.cr.endHeaderRefresh()
    }
    
    func stopBottomRefreshWith(_ events:[GFEvent]){
        self.allEvents = events
        self.tableView.cr.endLoadingMore()
        self.tableView.reloadData()
    }
    
    func stopBottomRefresh(){
        self.tableView.cr.endLoadingMore()
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GFFeedTableViewCell.rIdf) as! GFFeedTableViewCell
        cell.setupWith(allEvents[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repo = allEvents[indexPath.row].repo
        self.output.didSelectCell(with: repo)
        lastSelectedIdx = indexPath.row
    }
}

