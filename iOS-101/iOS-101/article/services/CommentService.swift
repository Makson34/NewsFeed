//
//  CommentService.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON
import Alamofire

typealias CommentsCompeletion = (_ comments: [CommentModel]?, _ error:String?)-> Void
class CommentService: TypicodeApiService {
    
    func comments(postId:Int,completion:  @escaping CommentsCompeletion){
        let url = host + "/comments"
        
        var params:[String:AnyObject] = [:]
        params["postId"] = postId as AnyObject
        
        self.sendRequestWithJSONResponse(requestType: HTTPMethod.get,
            url: url,
            params: params,
            headers: nil,
            paramsEncoding: URLEncoding.default) { (responseData, error) in
                if error != nil{
                    completion(nil, error!.localizedDescription)
                    return
                }else if let comments = responseData!.arrayObject{
                    let commentsModel = Mapper<CommentModel>().mapArray(JSONObject: comments)
                    completion(commentsModel,nil)
                    return
                }
                completion(nil,"Ошибка загрузки комментариев")
        }
    }
}
