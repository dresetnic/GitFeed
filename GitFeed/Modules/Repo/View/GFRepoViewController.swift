//
//  RepoGFRepoViewController.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 01/07/2019.
//  Copyright © 2019 Dreamcraft. All rights reserved.
//

import UIKit
import SnapKit


class RepoViewController: UIViewController, RepoViewInput {
    
    var output: RepoViewOutput!
    
    var tableView = UITableView(frame: CGRect.zero, style: .grouped)
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    
    // MARK: RepoViewInput
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
        self.title = "Repository"
        
        self.view.backgroundColor = .white
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(GFRepoGeneralInfoTableViewCell.self, forCellReuseIdentifier: GFRepoGeneralInfoTableViewCell.rIdf)
        self.tableView.separatorStyle = .none
        self.tableView.register(GFRepoOneFieldTableViewCell.self, forCellReuseIdentifier: GFRepoOneFieldTableViewCell.rIdf)
    }
    
    func reloadTableView(){
        self.tableView.reloadData()
    }
    
    func showShareButton(){
        let shareButton = UIBarButtonItem(title: "Share", style: .done, target: self, action: #selector(touchedShare))
//        self.navigationController?.navigationItem.rightBarButtonItem = shareButton
        self.navigationItem.rightBarButtonItem = shareButton
    }
    
    @objc func touchedShare(){
        self.output.touchedShareButton()
    }
    
    func showShareActivity(url: URL){
        let share = [ url ]
        let activityViewController = UIActivityViewController(activityItems: share , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
}

extension RepoViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.output.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.output.numberOfRepoInfoFields(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: GFRepoGeneralInfoTableViewCell.rIdf) as! GFRepoGeneralInfoTableViewCell
            cell.setupWith(self.output.repoInfo())
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: GFRepoOneFieldTableViewCell.rIdf) as! GFRepoOneFieldTableViewCell
            
            let info = self.output.infoForLineCell(at: indexPath.row)
            cell.setupWith(color: info.0, text: info.1)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.output.infoCellHeightFor(indexPath.row, section: indexPath.section)
    }
}
