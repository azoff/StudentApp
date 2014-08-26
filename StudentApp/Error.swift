//
//  Error.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Error : NSError {

	init(_ description:String, domain:String="ErrorDomain", code:Int=0) {
		super.init(domain: domain, code: code, userInfo: [NSLocalizedDescriptionKey:description])
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder:aDecoder)
	}

	func log() {
		Logger(self.domain).error("\(self.code)", self)
	}

}