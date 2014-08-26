//
//  User.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Group : Model, PFSubclassing {

	class func parseClassName() -> String? {
		return "Group"
	}

	override class func jsonMappings() -> Dictionary<String, String>? {
		return [
			"name": "name",
			"details": "description",
			"githubId": "id",
			"repositoryUrl": "url",
			"homepageUrl": "homepage",
			"avatarUrl": "avatar_url"
		]
	}

	var name : String? {
		get {
			return self["name"] as? String
		}
		set {
			self["name"] = newValue
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

	var githubId : Int? {
		get {
			return self["githubId"] as? Int
		}
		set {
			self["githubId"] = newValue
		}
	}

	var repositoryUrlString : String? {
		get {
			return self["repositoryUrl"] as? String
		}
		set {
			self["repositoryUrl"] = newValue
		}
	}

	var homepageUrlString : String? {
		get {
			return self["homepageUrl"] as? String
		}
		set {
			self["homepageUrl"] = newValue
		}
	}

}


















