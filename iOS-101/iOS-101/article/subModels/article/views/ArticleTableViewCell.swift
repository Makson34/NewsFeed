//
//  ArticleTableViewCell.swift
//  iOS-101
//
//  Created by 1 on 26.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
   
    static let nibName = "ArticleTableViewCell"
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var twoView: UIView!
    
    @IBOutlet weak var numLable: UILabel!
    
    func customize(article: ArticleModel){
        titleLable.text = article.title
        bodyLabel.text = article.body
        numLable.text = String(article.count)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        twoView.layer.cornerRadius = 5
        twoView.layer.shadowOffset = CGSize(width: 3, height: 3)
        twoView.layer.shadowOpacity = 0.3
        twoView.layer.shadowRadius = 4.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
