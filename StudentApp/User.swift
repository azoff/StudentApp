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

    private struct CurrentUser {
        static var instance : User?
        static let key = "codepath.StudentApp.CurrentUserKey"
    }

    class func current(callback:(User?) -> Void) {

        // first try to get the user from the instance cache
        if let user = CurrentUser.instance {
            callback(user)
            return
        }

        // write-through instance cache
        let done : (PFObject?, NSError?) -> Void = { (obj, _) in
            if let obj = obj {
                CurrentUser.instance = User(object:obj)
            } else {
                CurrentUser.instance = nil
            }
            callback(CurrentUser.instance)
        }

        // then try to get the user from NSUserDefaults
        let defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if let id = defaults.stringForKey(CurrentUser.key) {
            User(objectId:id).fetchIfNeededInBackgroundWithBlock(done)
            return
        }

        // finally, try to get the user from github
        if Github.singleton.isAuthorized {
            Github.singleton.user {
                defaults.setObject($0.objectId, forKey:CurrentUser.key) // write through NSUserDefaults
                defaults.synchronize()
                $0.fetchIfNeededInBackgroundWithBlock(done)
            }
        } else {
            callback(nil)
        }

    }

}


















