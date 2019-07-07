//
//  GFFeedTableViewCell.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 27/06/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import UIKit
import SDWebImage
import DateHelper

class GFFeedTableViewCell: UITableViewCell {
    
    let userNameLabel = UILabel()
    let eventLabel = UILabel()
    let userImageView = UIImageView()
    let dateLabel = UILabel()
    let repoNameLabel = UILabel()
    
    static let rIdf = "GFFeedTableViewCell"
    
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
        let childSubviews = [userNameLabel, userImageView, eventLabel, dateLabel, repoNameLabel]
        
        for childView in childSubviews{
            self.contentView.addSubview(childView)
        }
    }
    
    func setupConstraints(){
        userImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(100)
            make.left.top.equalToSuperview().inset(25)
        }
        
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userImageView)
            make.left.equalTo(userImageView.snp.right).offset(15)
            make.right.equalTo(dateLabel.snp.left).offset(10)
            make.height.equalTo(25)
        }
        
        eventLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userNameLabel)
            make.right.equalToSuperview().inset(25)
            make.top.equalTo(userNameLabel.snp.bottom).offset(15)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.height.equalTo(userNameLabel)
            make.right.equalToSuperview().inset(25)
            make.width.greaterThanOrEqualTo(100)
        }
    }
    
    func setupViews(){
        userImageView.backgroundColor = .lightGray
        userImageView.layer.cornerRadius = 8
        userImageView.clipsToBounds = true
        
        eventLabel.numberOfLines = 0
        eventLabel.lineBreakMode = .byCharWrapping
        
        dateLabel.textAlignment = .right
        dateLabel.font = UIFont.systemFont(ofSize: 12)
        dateLabel.textColor = .lightGray
    }
    
    func setupWith(_ event: GFEvent){
        userNameLabel.text = event.actor.displayName
        userImageView.sd_setImage(with: URL(string: event.actor.avatarUrl), placeholderImage: nil)
        
        eventLabel.attributedText = eventString(from: event)
        
        if let date = Date(fromString: event.date, format: .isoDateTimeSec){
            dateLabel.text = date.toStringWithRelativeTime()
        }
    }
    
    func eventString(from event: GFEvent) -> NSAttributedString {
        let middlePart = " on: "
        let fontSize: CGFloat = 18
        
        let finText = event.action + middlePart + event.repo.name
        let attributedText = NSMutableAttributedString(string: finText)
        attributedText.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: fontSize), range: NSRange(location: event.action.count + middlePart.count, length: event.repo.name.count))
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: fontSize), range: NSRange(location: 0, length: event.action.count))
        
        return attributedText
    }
}
