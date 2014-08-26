//
//  User.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class User : Model, PFSubclassing {

    let logger = Logger("User")
    
    class func parseClassName() -> String? {
        return "User"
    }

    override class func jsonMappings() -> Dictionary<String, String>? {
        return [
            "alias": "login",
            "githubId": "id",
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
        return self["githubId"] as? Int
    }

    private struct CurrentUser {
        static var instance : User?
        static let key = "codepath.StudentApp.CurrentUserKey"
    }

    class func current(success:((User) -> Void)? = nil, failure:((NSError) -> Void)? = nil) {

        // first, try to get the user from the instance cache
        if let user = CurrentUser.instance {
            success?(user)
            return
        }

        // we can store the current user ID in user defaults
        let defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()

        // there are two places where we try to get the user from github,
        // so let's cache a closure to it here...
        let tryGithub : () -> Void = {
            if Github.singleton.isAuthorized {

                Github.singleton.user({
                    let user = $0
                    user.saveInBackgroundWithBlock { (_, error) in
                        if let error = error {
                            CurrentUser.instance = nil
                            failure?(error)
                        } else {
                            defaults.setObject(CurrentUser.instance!.objectId, forKey:CurrentUser.key)
                            defaults.synchronize()
                            CurrentUser.instance = user
                            success?(user)
                        }
                    }
                }, failure)

            } else {

                failure?(Error("Unable to load current user from github"))

            }
        }

        // now, try to get the user from NSUserDefaults
        if let id = defaults.stringForKey(CurrentUser.key) {

            User(objectId:id).fetchInBackgroundWithBlock { (user, error) in
                if let error = error {
                    Logger("User").error("current(success:failure:)", error)
                    tryGithub()
                } else if let user = user as? User {
                    CurrentUser.instance = user
                    success?(user)
                } else {
                    failure?(Error("Unexpected state when trying to load current user"))
                }
            }

        // finally, if that fails, try to get the user from github
        } else {
            tryGithub()
        }

    }

}


















