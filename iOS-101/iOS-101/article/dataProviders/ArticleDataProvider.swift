//
//  ArticleDataProvider.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Foundation
import UIKit

protocol ArticleDataProviderDelegate: class {
    func articleDataDidLoad()
    func articleDataHasError(error:String)
   
}

class ArticleDataProvider: NSObject {
    
    var article: ArticleModel = ArticleModel()
    var comments: [CommentModel] = []
    var images: [UIImage] = []
    
    
    weak var delegate : ArticleDataProviderDelegate?
    
    func refresh(){
        comments = []
        images = []
        loadData()
        loadImage(completion: nil)
       
    }
    func loadData(){
        if article.id != nil{
            SharedApiService.sharedInstance.commentService.comments(postId: article.id!, completion: { (commentsResponse, errors) in
                if let error = errors {
                    self.delegate?.articleDataHasError(error: error)
                    return
                }else if let commentsArray:[CommentModel] = commentsResponse{
                    self.comments.append(contentsOf: commentsArray)
                    self.delegate?.articleDataDidLoad()
                        
                        return
                    
                }
                self.delegate?.articleDataDidLoad()
            })
        }
    }
    func loadImage(completion: (() -> ())?){
        if article.id != nil{
        SharedApiService.sharedInstance.imageService.images(albumId: article.id!, completion: { (imageResponse,data, errors) in
                if let error = errors {
                    self.delegate?.articleDataHasError(error: error)
                    return
                }else if let dataArray = data {
                    for obj in dataArray{
                       let image = UIImage(data: obj)
                        self.images.append(image!)
                    }
                    self.delegate?.articleDataDidLoad()
                    debugPrint(self.images.count)
                    guard let completion = completion else {return}
                   
                    completion()
                    return
                }
                
                self.delegate?.articleDataDidLoad()
            guard let completion = completion else { return }
            completion()
            })
        }
    }
    
    
    func getImage(index: Int)-> UIImage {
        if images.count != 0 {
            return images[index]
        }
        return UIImage()
    }
}

