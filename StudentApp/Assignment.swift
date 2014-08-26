//
//  Location.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Assignment : Model, PFSubclassing {

	class func parseClassName() -> String? {
		return "Assignment"
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

	var due : Double? {
		get {
			return self["due"] as? Double
		}
		set {
			self["due"] = newValue
		}
	}

	var dueDate : NSDate? {
		if let timestamp : Double = due {
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

	// TODO: this needs to be a week model
	var week : PFObject? {
		get {
			return self["week"] as? PFObject
		}
		set {
			self["week"] = newValue
		}
	}

}