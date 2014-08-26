//
//  JSONValue+lookup.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

extension JSONValue {

    func lookup(path:String) -> JSONValue {
        let path = split(path) { $0 == "." }
        return lookup(path)
    }

    func lookup(path:[String]) -> JSONValue {
        let first : String = path[0]
        if path.count > 1 {
            let rest : [String] = Array(path[1...path.count])
            return lookup(rest)
        } else {
            return self[first]
        }
    }

}