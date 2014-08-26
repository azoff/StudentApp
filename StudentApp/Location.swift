//
//  Location.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Loction : Model, PFSubclassing {

	class func parseClassName() -> String? {
		return "Location"
	}

	var name : String? {
		get {
			return self["name"] as? String
		}
		set {
			self["name"] = newValue
		}
	}

	var address : String? {
		get {
			return self["address"] as? String
		}
		set {
			self["address"] = newValue
		}
	}

	var geo : PFGeoPoint? {
		get {
			return self["geo"] as? PFGeoPoint
		}
		set {
			self["geo"] = newValue
		}
	}

	var radius : Int? {
		get {
			return self["radius"] as? Int
		}
		set {
			self["radius"] = newValue
		}
	}

}