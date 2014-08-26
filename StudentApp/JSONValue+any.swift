//
//  JSONValue+anyObject.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/25/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

extension JSONValue {

	var any : AnyObject? {
		switch self {
		case .JNull:
			return nil
		case .JBool(let value):
			return value
		case .JString(let value):
			return value
		case .JNumber(let value):
			return value
		default:
			return self.description
		}
	}

}