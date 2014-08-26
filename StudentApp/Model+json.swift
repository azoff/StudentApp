//
//  Model+json.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

extension Model {
    
    class func jsonMappings() -> Dictionary<String, String>? {
        return nil
    }

    class func object(json:JSONValue) -> Self {
        let obj = object()
        if let mappings = jsonMappings() {
            for (key, path) in mappings {
                obj[key] = json.lookup(path).any
            }
        }
        return obj
    }

    class func object(data:NSData) -> Self {
        var error : NSError?
        if let obj : AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) {
            return object(JSONValue(obj))
        } else {
            fatalError("Unable to decode JSON")
        }
    }
}