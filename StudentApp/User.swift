//
//  User.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class User : Model, PFSubclassing {
    
    class func parseClassName() -> String? {
        return "User"
    }

    override class func jsonMappings() -> Dictionary<String, String>? {
        return [
            "alias": "login",
            "objectId": "id",
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

}