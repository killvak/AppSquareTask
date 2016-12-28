//
//  RepoVars.swift
//  AppsSquareTask
//
//  Created by Killvak on 28/12/2016.
//  Copyright © 2016 Killvak. All rights reserved.
//

import Foundation
import SwiftyJSON
class RepoVars {
    
    private var _id  : Int?
    private var _name : String?
    private var _fullName : String?
    var repoOwner : RepoOwner?
    private var _description : String?
    
    private var id : Int {
        guard let id_ = _id else { return 0 }
        return id_
    }
    
    var name : String {
        guard let name_ = _name else { return "" }
        return name_
    }
    
    var fullName : String {
        guard let fullName_ = _fullName else { return "" }
        return fullName_
    }
    
    var description : String {
        guard let description_ = _description else { return "" }
        return description_
    }
    
    init(jsonData : JSON) {
        
        self._name = jsonData["name"].stringValue
        self._fullName = jsonData["full_name"].stringValue
        self._id = jsonData["id"].intValue
        self._description = jsonData["description"].stringValue
    }
}


class RepoOwner {
    
    var _login : String?
    var _url : String?
    var _reposUrl : String?
    var _language : String?
    
    init(data:JSON) {
        self._login = data["login"].stringValue
        self._url = data["url"].stringValue
        self._reposUrl = data["repos_url"].stringValue
        self._language = data["language"].stringValue
    }
    
    
}
