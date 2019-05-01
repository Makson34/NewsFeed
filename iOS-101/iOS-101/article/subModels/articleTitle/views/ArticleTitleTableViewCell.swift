//
//  ArticleTitleTableViewCell.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import UIKit

class ArticleTitleTableViewCell: UITableViewCell {

    static let nibName = "ArticleTitleTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func customize(article: ArticleModel){
        titleLabel.text = article.title
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
