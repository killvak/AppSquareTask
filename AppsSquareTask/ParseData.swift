//
//  ParseData.swift
//  AppsSquareTask
//
//  Created by Killvak on 28/12/2016.
//  Copyright © 2016 Killvak. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class  ParseData {
    
    
    func GetData(completed : @escaping () ->()) {
        
        let request = alamoRequest(query_url: BASE_URL)
        Alamofire.request(request).responseJSON { (response) in
               print(response.result)
                switch(response.result) {
                case .success(_):
                    print("Success")
                    //                        URLCache.shared.removeAllCachedResponses()
                    let cachedURLResponse = CachedURLResponse(response: response.response!, data: (response.data! as NSData) as Data, userInfo: nil, storagePolicy: .allowed)
                    URLCache.shared.storeCachedResponse(cachedURLResponse, for: response.request!)
                    
                    guard response.result.error == nil else {
                        
                        // got an error in getting the data, need to handle it
                        print("error fetching data from url")
                        print(response.result.error!)
                        return
                        
                    }
                    let json = JSON(data: cachedURLResponse.data) // SwiftyJSON
                    print(json)

                    
                    completed()
                    break
                case .failure(_) :
                    print("that is fail i n getting the data Mate : %@",response.result.error)
                    if let urlRequest = request.urlRequest {
                        let x = URLCache.shared.cachedResponse(for: urlRequest)
                        guard let cache = x else {
                            completed()
                            return
                        }
                        let json = JSON(data: cache.data) // SwiftyJSON
                        //
                        print(json)
                        completed()
                    }
                    
                    break
                }
        }
        
    }
    
    
    func alamoRequest (query_url : String ) -> URLRequest {
        
        // escape your URL
        let urlAddressEscaped = query_url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
      
        //Request with caching policy
        var request = URLRequest(url: URL(string: urlAddressEscaped!)!, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 3)
        return  request
    }
    
    
    
    
    
    
}
