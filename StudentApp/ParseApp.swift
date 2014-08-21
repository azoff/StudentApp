//
//  Parse.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class ParseApp {
    
    let settings : NSDictionary
    
    init() {
        if let settings = Credentials.dict("Parse") {
            self.settings = settings
        } else {
            fatalError("init(): missing parse settings")
        }
    }
    
    func register() {
        
    }
    
    class var singleton : ParseApp {
    struct Static {
        static let instance = ParseApp()
        }
        return Static.instance
    }
    
}
