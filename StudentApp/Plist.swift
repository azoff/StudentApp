//
//  Plist.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/20/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Plist {

	private let dict : NSDictionary = NSDictionary()

	subscript (index : String) -> AnyObject {
		return dict.valueForKeyPath(index)
	}

	init(name : String) {
		let bundle = NSBundle.mainBundle()
		if let path = bundle.pathForResource(name, ofType: "plist") {
			dict = NSDictionary(contentsOfFile: path)
		}
	}

	class func dict(name: String) -> Dictionary<String, String>? {
		return singleton[name] as? Dictionary<String, String>
	}

	class var singleton : Plist {
		fatalError("subclass must override singleton()")
	}

}