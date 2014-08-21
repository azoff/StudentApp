//
//  Info.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/20/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Info : Plist {
    
    
    class var appScheme : String {
        let types = singleton["CFBundleURLTypes"] as NSArray
        let type = types[0] as NSDictionary
        let schemes = type.valueForKey("CFBundleURLSchemes") as NSArray
        return schemes[0] as String
    }
    
    class var callbackUrl : String {
        return "\(self.appScheme)://callback"
    }
    
    override class var singleton : Info {
        struct Static {
            static let instance = Info(name: "Info")
        }
        return Static.instance
    }

}