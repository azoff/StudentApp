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