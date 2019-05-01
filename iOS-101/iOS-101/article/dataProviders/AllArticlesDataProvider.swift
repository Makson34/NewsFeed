//
//  AllArticlesDataProvider.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Foundation

protocol AllArticlesDataProviderDelegate: class {
    func articlesDataLoaded()
    func articlesDataHasError(error:String)
}
class AllArticlesDataProvider: NSObject{
    
    var articles:[ArticleModel] = []
    
    weak var delegate: AllArticlesDataProviderDelegate?
    
    
    func refresh(){
        articles = []
        loadArticles()
        
    }
    
    func loadArticles(){
        SharedApiService.sharedInstance.articleService.posts(limit: 100, skip: 0) { (articlesResponse, errors) in
            
            if let error = errors {
                self.delegate?.articlesDataHasError(error: error)
                return
            }else if let articles:[ArticleModel] = articlesResponse{
                self.articles.append(contentsOf:articles)
                self.loadComment()
                return
            }
            self.delegate?.articlesDataLoaded()
        }
    }
    func loadComment(){
        for num in self.articles{
            var comments: [CommentModel] = []
            if num.id != nil{
                SharedApiService.sharedInstance.commentService.comments(postId: num.id!, completion: { (commentsResponse, errors) in
                    if let error = errors {
                        self.delegate?.articlesDataHasError(error: error)
                        return
                    }else if let commentsArray:[CommentModel] = commentsResponse{
                        comments.append(contentsOf: commentsArray)
                        num.count = comments.count
                        self.delegate?.articlesDataLoaded()
                        return
                    }
                    self.delegate?.articlesDataLoaded()
                })
            }
        }
    }
    
}
