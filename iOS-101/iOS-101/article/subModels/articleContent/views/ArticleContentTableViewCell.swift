//
//  ArticleContentTableViewCell.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import UIKit

class ArticleContentTableViewCell: UITableViewCell {

    static let nibName = "ArticleContentTableViewCell"
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    func customize(article:ArticleModel){
        bodyLabel.text = article.body
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
