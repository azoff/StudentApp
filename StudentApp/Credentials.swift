//
//  Credentials.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/20/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Credentials : Plist {
	override class var singleton : Credentials {
		struct Static {
			static let instance = Credentials(name: "Credentials")
		}
		return Static.instance
	}
}