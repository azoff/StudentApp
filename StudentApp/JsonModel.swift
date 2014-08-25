//
//  JsonModel.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation


class JSONBackedModel {

    let json : JSONValue?

    init(data : NSData) {
        json = JSONValue(data)
    }


}