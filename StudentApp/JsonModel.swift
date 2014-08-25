//
//  JsonModel.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class JSONModel : PFObject {

    init(_ nonce:Bool) {
        if nonce {
            super.init(className:self.className)
        } else {
            super.init()
        }
    }

    convenience override init() {
        self.init(false)
    }

    convenience init(_ json:JSONValue) {
        self.init(true)
        if let mappings = mappings {
            for (key, path) in mappings {
                setJSONValue(key, path:path, json:json)
            }
        }
    }

    convenience init(_ data : NSData) {
        var error : NSError?
        if let obj : AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) {
            self.init(JSONValue(obj))
        } else {
            fatalError("Unable to decode JSON")
        }
    }

    var mappings : Dictionary<String, String>? {
        return nil
    }

    var className : String? {
        return nil
    }

    func setJSONValue(key:String, path:String, json:JSONValue) {
        let path = split(path) { $0 == "." }
        setJSONValue(key, path:path, json:json)
    }

    func setJSONValue(key:String, path:[String], json:JSONValue) {
        let first : String = path[0]
        if path.count > 1 {
            let rest : [String] = Array(path[1...path.count])
            setJSONValue(key, path:rest, json:json[first])
        } else {
            let value = json[first]
            switch value {
                case .JNull:
                    self[key] = nil
                case .JBool(let value):
                    self[key] = value
                case .JString(let value):
                    self[key] = value
                case .JNumber(let value):
                    self[key] = value
                default:
                    println("setJSONValue(): Invalid value for \(key), \(value)")
            }
        }
    }

}