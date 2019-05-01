//
//  ArticleModel.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Foundation
import ObjectMapper

class ArticleModel: NSObject , Mappable {
    var id: Int?
    var userId: Int?
    var title : String?
    var body: String?
    var count:Int
    
    override init(){
         count = 0
        super.init()
       
    }
    
    required init?(map: Map) {
         count = 0
         super.init()
    }
    
    func mapping(map: Map){
        id       <- map["id"]
        userId   <- map["userId"]
        title    <- map["title"]
        body     <- map["body"]
    }
}
