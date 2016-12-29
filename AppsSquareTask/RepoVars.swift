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
    private  var _fork  : Bool?
    private var _htmlUrl : String?

    
    var fork : Bool {
        guard let fork_ = _fork else { return true }
        return fork_
    }
    
    var htmlUrl : String {
        guard let htmlUrl_ = _htmlUrl else { return "" }
        return htmlUrl_
    }
    
     var id : Int {
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
        self._fork = jsonData["fork"].boolValue
        self._htmlUrl = jsonData["html_url"].stringValue
    }
    
}



