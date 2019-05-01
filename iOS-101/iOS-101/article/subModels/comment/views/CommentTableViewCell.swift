//
//  CommentTableViewCell.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import UIKit
import Kingfisher

class CommentTableViewCell: UITableViewCell {

    static let nibName = "CommentTableViewCell"
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagesView: UIImageView!
    
    func customize (comment: CommentModel, image:UIImage){
        nameLabel.text = comment.name
        commentLabel.text = comment.body
        imagesView.image = image
            
        
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
