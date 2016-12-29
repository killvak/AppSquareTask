//
//  RepoOwner.swift
//  AppsSquareTask
//
//  Created by Killvak on 29/12/2016.
//  Copyright © 2016 Killvak. All rights reserved.
//

import Foundation
import SwiftyJSON

class RepoOwner {
    
    var _login : String?
    var _url : String?
    var _reposUrl : String?
    var _language : String?
    private var _htmlUrl : String?
    
    
    
    var htmlUrl : String {
        guard let htmlUrl_ = _htmlUrl else { return "" }
        return htmlUrl_
    }
    
    init(data:JSON) {
        self._login = data["login"].stringValue
        self._url = data["url"].stringValue
        self._reposUrl = data["repos_url"].stringValue
        self._language = data["language"].stringValue
        self._htmlUrl = data["html_url"].stringValue
        
    }
    
    
}
