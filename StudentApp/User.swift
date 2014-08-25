//
//  User.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class User : JSONModel {
    
    override var className : String? {
        return "user"
    }
    
    override var mappings : Dictionary<String, String>? {
        return [
            "alias": "login",
            "ghid": "id",
            "name": "name",
            "email": "email"
        ]
    }

    var alias : String? {
        return self["alias"] as? String
    }

    var name : String? {
        return self["name"] as? String
    }

    var firstName : String? {
        if let name = name {
            return first(split(name) { $0 == " " })
        } else {
            return nil
        }
    }

    var lastName : String? {
        if let name = name {
            return last(split(name) { $0 == " " })
        } else {
            return nil
        }
    }

    var email : String? {
        return self["email"] as? String
    }

    var githubId : Int? {
        return self["ghid"] as? Int
    }

}