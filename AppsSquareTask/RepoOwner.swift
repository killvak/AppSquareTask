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
    
    private var _login : String?
    private var _htmlUrl : String?

    
    var login : String {
        guard let login_ = _login else { return "" }
        return login_
    }
    
    var htmlUrl : String {
        guard let htmlUrl_ = _htmlUrl else { return "" }
        return htmlUrl_
    }
    
    init(data:JSON) {
        self._login = data["login"].stringValue
        self._htmlUrl = data["html_url"].stringValue
        
    }
    
    
}
