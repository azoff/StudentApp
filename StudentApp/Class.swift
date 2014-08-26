//
//  User.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Class : Model, PFSubclassing {

	class func parseClassName() -> String? {
		return "Class"
	}

	var name : String? {
		get {
			return self["name"] as? String
		}
		set {
			self["name"] = newValue
		}
	}

	var location : Location? {
		get {
			return self["location"] as? Location
		}
		set {
			self["location"] = newValue
		}
	}

}


















