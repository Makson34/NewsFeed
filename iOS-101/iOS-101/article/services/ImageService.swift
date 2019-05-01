//
//  ImageService.swift
//  iOS-101
//
//  Created by 1 on 02.07.18.
//  Copyright © 2018 Maksim Zybin. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON
import Alamofire

typealias ImageComplection = (_ images:[ImageModel]?,_ data:[Data]?, _ error:String?)-> Void

class ImageService:TypicodeApiService{
    
    func images(albumId:Int,completion: @escaping ImageComplection){
        let url = host + "/photos"
        var params:[String:AnyObject] = [:]
        params["albumId"] = albumId as AnyObject
        self.sendRequestWithJSONResponse(requestType: HTTPMethod.get,
        url: url,
        params: params,
        headers: nil,
        paramsEncoding: URLEncoding.default)
        { (responseData, error) in
            if error != nil{
                completion(nil,nil, error!.localizedDescription)
                    return
              }else if let images = responseData!.arrayObject{
                let imageModel = Mapper<ImageModel>().mapArray(JSONObject: images)
                var dataArray:[Data] = []
                for model in imageModel!{
                    do{
                        guard let urlString = model.url else {return}
                        if let url = URL(string: urlString) {
                            let data = try Data(contentsOf: url)
                                dataArray.append(data)
                        }
                    }
                    catch{
                    debugPrint(error)
                    }
                }
                
                    completion(imageModel,dataArray,nil)
                    return
                    }
                  completion(nil,nil,"Ошибка загрузки комментариев")
        }
    }
    
    
}
