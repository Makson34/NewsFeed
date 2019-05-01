//
//  CommentModel.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Foundation
import ObjectMapper

class CommentModel: NSObject, Mappable{
    var postId: Int?
    var id: Int?
    var name : String?
    var email: String?
    var body: String?
    var url:String?
    
    override init(){
        super.init()
    }
    required init?(map: Map) {
        super.init()
        self.mapping(map: map)
    }
    
    func mapping(map:Map){
        postId <- map["postId"]
        id    <- map["id"]
        name  <- map["name"]
        email <- map["email"]
        body  <- map["body"]
        
    }
}
