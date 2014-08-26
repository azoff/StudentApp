//
//  Model.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Model : PFObject {

    required override init() {
        super.init()
    }

    convenience init(objectId:String) {
        self.init()
        self.objectId = objectId
    }

    convenience init(object:PFObject) {
        self.init()
        for key in object.allKeys() {
            let key = key as String
            self[key] = object[key]
        }
    }

    // PFSubclassing

    override var objectId : String? {
        get {
            return self["objectId"] as? String
        }
        set {
            self["objectId"] = newValue
        }
    }

}