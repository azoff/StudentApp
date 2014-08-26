//
//  Logger.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

class Logger {

	enum Severity : Printable {
		case Debug, Info, Warning, Error, Fatal
		var description : String {
			switch self {
				case Debug: return "🚧"
				case Info: return "💡"
				case Warning: return "⛔"
				case Error: return "💥"
				case Fatal: return "💀"
			}
		}
	}

	init(_ className:String) {
		self.className = className
	}

	let className : String

	func log(methodName:String, _ message:String, _ severity:Severity) {
		println("\(severity) \(className).\(methodName) 👉 \(message)")
	}

	func debug(methodName:String, _ message:String) {
		log(methodName, message, .Debug)
	}

	func info(methodName:String, _ message:String) {
		log(methodName, message, .Info)
	}

	func warning(methodName:String, _ message:String) {
		log(methodName, message, .Warning)
	}

	func error(methodName:String, _ message:String) {
		log(methodName, message, .Error)
	}

	func error(methodName:String, _ err:NSError) {
		error(methodName, err.localizedDescription)
	}

	func fatal(methodName:String, _ message:String) {
		log(methodName, message, .Fatal)
	}

	func fatal(methodName:String, _ err:NSError) {
		fatal(methodName, err.localizedDescription)
	}

}