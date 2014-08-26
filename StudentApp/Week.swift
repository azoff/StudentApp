//
//  User.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Week : Model, PFSubclassing {

	class func parseClassName() -> String? {
		return "Week"
	}

	var name : String? {
		get {
			return self["name"] as? String
		}
		set {
			self["name"] = newValue
		}
	}

	var number : Int? {
		get {
			return self["number"] as? Int
		}
		set {
			self["number"] = newValue
		}
	}

	var parentClass : Class? {
		get {
			return self["class"] as? Class
		}
		set {
			self["class"] = newValue
		}
	}

}


















