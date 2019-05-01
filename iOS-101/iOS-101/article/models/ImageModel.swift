//
//  ImageModel.swift
//  iOS-101
//
//  Created by 1 on 02.07.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Foundation
import ObjectMapper

class ImageModel:NSObject,Mappable{
    var albumId:Int?
    var id:Int?
    var title:String?
    var url:String?
    var thumbnailUrl:String?
    
    override init(){
        super.init()
    }
    required init?(map: Map) {
        super.init()
         self.mapping(map: map)
    }
     func mapping(map: Map) {
        albumId       <- map["albumId"]
        id            <- map["id"]
        title         <- map["title"]
        url           <- map["url"]
        thumbnailUrl  <- map["thumbnailUrl"]
    }
}
