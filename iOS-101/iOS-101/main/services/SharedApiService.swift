//
//  SharedApiService.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Foundation

class SharedApiService: NSObject {
    static let sharedInstance: SharedApiService = {SharedApiService()}()
    
    private(set) var articleService: ArticleService
    private(set) var commentService: CommentService
    private(set) var imageService:ImageService
    
    private override init(){
        self.articleService = ArticleService()
        self.commentService = CommentService()
        self.imageService = ImageService()
    }
}
