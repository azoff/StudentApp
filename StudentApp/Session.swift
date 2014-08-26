//
//  Location.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Session : Model, PFSubclassing {

	class func parseClassName() -> String? {
		return "Session"
	}

	var title : String? {
		get {
			return self["title"] as? String
		}
		set {
			self["title"] = newValue
		}
	}

	var details : String? {
		get {
			return self["details"] as? String
		}
		set {
			self["details"] = newValue
		}
	}

	var start : Double? {
		get {
			return self["start"] as? Double
		}
		set {
			self["start"] = newValue
		}
	}

	var end : Double? {
		get {
			return self["end"] as? Double
		}
		set {
			self["end"] = newValue
		}
	}

	var startDate : NSDate? {
		if let timestamp : Double = start {
			return NSDate(timeIntervalSince1970:timestamp)
		}
		return nil
	}

	var endDate : NSDate? {
		if let timestamp : Double = end {
			return NSDate(timeIntervalSince1970:timestamp)
		}
		return nil
	}

	var media : String? {
		get {
			return self["media"] as? String
		}
		set {
			self["media"] = newValue
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

	var parentWeek : Week? {
		get {
			return self["week"] as? Week
		}
		set {
			self["week"] = newValue
		}
	}

}