//
//  ArticleService.swift
//  iOS-101
//
//  Created by 1 on 27.06.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Alamofire
import ObjectMapper
import SwiftyJSON


typealias ArticlesPostCompletion = (_ articles: [ArticleModel]?,_ error: String?)->Void
class ArticleService: TypicodeApiService {
    
    func posts(limit:Int, skip:Int, completion: @escaping ArticlesPostCompletion){
        let url = host + "/posts"
        
        
        var params:[String:AnyObject] = [:]
        params["limit"] = limit as AnyObject
        params["skip"] = skip as AnyObject
        
        self.sendRequestWithJSONResponse(requestType: HTTPMethod.get,
                                         url: url,
                                         params: params, headers: nil, paramsEncoding: URLEncoding.default) { (responseData, error) in
                                            if error != nil {
                                                completion(nil,error!.localizedDescription)
                                                return
                                            }else if let articles = responseData!.arrayObject{
                                                let articleModels = Mapper<ArticleModel>().mapArray(JSONObject: articles)
                                                completion(articleModels,nil)
                                                return
                                            }
                                            completion(nil,"Ошибка загрузки каталога")
        }
    }
    
    
}
