//
//  GFRepoGeneralInfoTableViewCell.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 02/07/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import UIKit

class GFRepoGeneralInfoTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let fullNameLabel = UILabel()
    let descriptionLabel = UILabel()
    let separatorView = UIView()
    
    let subscribersLabel = UILabel()
    let subscribersNumberLabel = UILabel()
    
    let watchersLabel = UILabel()
    let watchersNumberLabel = UILabel()
    
    let starsLabel = UILabel()
    let starsNumberLabel = UILabel()
    
    static let rIdf = "GFRepoGeneralInfoTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupCell() {
        addSubviews()
        setupConstraints()
        setupViews()
    }
    
    func addSubviews(){
        let childSubviews = [nameLabel, fullNameLabel,  descriptionLabel, separatorView, subscribersLabel, subscribersNumberLabel, starsLabel, starsNumberLabel, watchersLabel, watchersNumberLabel]
        
        for childView in childSubviews{
            self.contentView.addSubview(childView)
        }
    }
    
    func setupConstraints(){
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(30)
            make.right.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        self.fullNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.height.equalTo(25)
            make.top.equalTo(nameLabel.snp.bottom)
            make.right.equalTo(nameLabel)
        }
        
        self.descriptionLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(fullNameLabel)
            make.top.equalTo(fullNameLabel.snp.bottom)
            make.bottom.equalTo(separatorView.snp.top).inset(-10)
        }
        
        self.separatorView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(0.5)
            make.bottom.equalToSuperview().inset(100)
        }
        
        self.subscribersNumberLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(0.4)
            make.top.equalTo(separatorView.snp.bottom).offset(30)
            make.height.equalTo(30)
        }
        
        self.subscribersLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(subscribersNumberLabel)
            make.height.equalTo(20)
            make.top.equalTo(subscribersNumberLabel.snp.bottom).inset(5)
        }
        
        self.starsNumberLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.height.equalTo(subscribersNumberLabel)
        }
        
        self.starsLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(starsNumberLabel)
            make.centerY.height.equalTo(subscribersLabel)
        }
        
        self.watchersNumberLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().multipliedBy(1.6)
            make.top.height.equalTo(starsNumberLabel)
        }
        
        self.watchersLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(watchersNumberLabel)
            make.centerY.height.equalTo(starsLabel)
        }
    }
    
    func setupViews(){
        self.nameLabel.font = .boldSystemFont(ofSize: 27)
        self.fullNameLabel.font = .systemFont(ofSize: 20)
        self.fullNameLabel.textColor = .blue
        
        self.selectionStyle = .none
        descriptionLabel.textColor = .gray
        descriptionLabel.font = .systemFont(ofSize: 20)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byCharWrapping
        
        fullNameLabel.numberOfLines = 0
        fullNameLabel.lineBreakMode = .byCharWrapping
        
        separatorView.backgroundColor = .lightGray
        
        subscribersNumberLabel.textAlignment = .center
        subscribersLabel.text = "Subscribers"

        starsLabel.text = "Stars"
        watchersLabel.text = "Watchers"
        
        let smallBottomTextLabels = [subscribersLabel, watchersLabel, starsLabel]
        for label in smallBottomTextLabels{
            label.textAlignment = .center
            label.textColor = UIColor.lightGray
            label.font = .systemFont(ofSize: 12)
        }
        
        let numberBottomTextLabels = [subscribersNumberLabel, watchersNumberLabel, starsNumberLabel]
        for label in numberBottomTextLabels{
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 20)
        }
    }
    
    func setupWith(_ repoDetails: GFRepoDetails){
        nameLabel.text = repoDetails.name
        fullNameLabel.text = repoDetails.fullName
        descriptionLabel.text = repoDetails.description
        
        subscribersNumberLabel.text = String(repoDetails.subscribers)
        starsNumberLabel.text = String(repoDetails.stars)
        watchersNumberLabel.text = String(repoDetails.watchers)
    }
}
