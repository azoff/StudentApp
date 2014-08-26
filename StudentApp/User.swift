//
//  User.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/24/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class User : Model, PFSubclassing {

	let logger = Logger("User")
	
	class func parseClassName() -> String? {
		return "User"
	}

	override class func jsonMappings() -> Dictionary<String, String>? {
		return [
			"alias": "login",
			"githubId": "id",
			"name": "name",
			"email": "email"
		]
	}

	var alias : String? {
		get {
			return self["alias"] as? String
		}
		set {
			self["alias"] = newValue
		}
	}

	var name : String? {
		get {
			return self["name"] as? String
		}
		set {
			self["name"] = newValue
		}
	}

	var firstName : String? {
		if let name = name {
			return first(split(name) { $0 == " " })
		} else {
			return nil
		}
	}

	var lastName : String? {
		if let name = name {
			return last(split(name) { $0 == " " })
		} else {
			return nil
		}
	}

	var email : String? {
		get {
			return self["email"] as? String
		}
		set {
			self["email"] = newValue
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

	private struct CurrentUser {
		static var instance : User?
		static let key = "codepath.StudentApp.CurrentUserKey"
	}

	class func current(success:((User) -> Void)? = nil, failure:((NSError) -> Void)? = nil) {

		let logger = Logger("User")
		logger.info("current(success:failure:)", "Retreiving current user...")

		// first, try to get the user from the instance cache
		if let user = CurrentUser.instance {
			logger.info("current(success:failure:)", "User found in instance cache.")
			success?(user)
			return
		}

		// we can store the current user ID in user defaults
		let defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()

		// there are two places where we try to get the user from github,
		// so let's cache a closure to it here...
		let tryGithub : () -> Void = {
			logger.info("current(success:failure:)", "Fetching authorized user from github...")
			if Github.singleton.isAuthorized {
				Github.singleton.user({
					let user = $0
					user.saveInBackgroundWithBlock { (_, error) in
						if let error = error {
							CurrentUser.instance = nil
							logger.error("current(success:failure:)", error)
							failure?(error)
						} else {
							logger.info("current(success:failure:)", "User not found in cache, retrieved from github.")
							defaults.setObject(user.objectId, forKey:CurrentUser.key)
							defaults.synchronize()
							CurrentUser.instance = user
							success?(user)
						}
					}
				}, {
					logger.error("current(success:failure:)", $0)
					failure?($0)
				})
			} else {
				let error = Error("Unable to load current user from github")
				logger.error("current(success:failure:)", error)
				failure?(error)
			}
		}

		// now, try to get the user from NSUserDefaults
		if let id = defaults.stringForKey(CurrentUser.key) {

			logger.info("current(success:failure:)", "User ID found in user defaults, fetching...")
			User(objectId:id).fetchInBackgroundWithBlock { (user, error) in
				if let error = error {
					logger.warning("current(success:failure:)", "Error fetching user from parse, trying github instead")
					tryGithub()
				} else if let user = user as? User {
					logger.info("current(success:failure:)", "User retrieved from parse!")
					CurrentUser.instance = user
					success?(user)
				} else {
					let error = Error("Unexpected state when trying to load current user")
					logger.error("current(success:failure:)", error)
					failure?(error)
				}
			}

		// finally, if that fails, try to get the user from github
		} else {

			tryGithub()
		}

	}

}


















