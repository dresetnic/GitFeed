//
//  GFRepoOneFieldTableViewCell.swift
//  GitFeed
//
//  Created by Dragos Resetnic on 02/07/2019.
//  Copyright © 2019 Dragos Resetnic. All rights reserved.
//

import UIKit

class GFRepoOneFieldTableViewCell: UITableViewCell {

    let infoTextLabel = UILabel()
    let colorCircleView = UIView()
    
    static let rIdf = "GFRepoOneFieldTableViewCell"
    
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
        let childSubviews = [infoTextLabel, colorCircleView]
        
        for childView in childSubviews{
            self.contentView.addSubview(childView)
        }
    }
    
    func setupConstraints(){
        colorCircleView.snp.makeConstraints { (make) in
            make.height.width.equalTo(20)
            make.left.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
        
        infoTextLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.left.equalTo(colorCircleView.snp.right).offset(10)
        }
    }
    
    func setupViews(){
        self.selectionStyle = .none
        
        colorCircleView.backgroundColor = .red
        colorCircleView.layer.cornerRadius = 10
        colorCircleView.clipsToBounds = true
        
        
        infoTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    func setupWith(color: UIColor, text: String){
        colorCircleView.backgroundColor = color
        infoTextLabel.text = text
    }
}
