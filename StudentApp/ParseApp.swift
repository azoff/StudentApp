//
//  Parse.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class ParseApp {
    
    init() {
        registerSubclasses()
        if let dict = Credentials.dict("Parse") {
            let appId = dict["application_id"] as String!
            let clientKey = dict["client_key"] as String!
            Parse.setApplicationId(appId, clientKey:clientKey);
        } else {
            fatalError("init(): missing parse settings")
        }
    }

    private func registerSubclasses() {
        User.registerSubclass()
    }

    func trackLaunch(launchOptions: NSDictionary!) -> Bool {
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        return true
    }
    
    class var singleton : ParseApp {
    struct Static {
        static let instance = ParseApp()
        }
        return Static.instance
    }
    
}
