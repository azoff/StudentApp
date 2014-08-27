//
//  Theme.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/20/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation
import UIKit

class Theme {

	struct Color {
		static let NoColor = UIColor.clearColor()
		static let DarkBlue = UIColor(hue:0.613, saturation:0.521, brightness:0.188, alpha:1.000)
		static let LightBlue = UIColor(hue:0.596, saturation:0.424, brightness:1.000, alpha:1.000)
		static let LightGreen = UIColor(red:0.522, green:0.745, blue:0.584, alpha:1.000)
	}

	class func applyToRootView(view:UIView) {
		view.backgroundColor = Theme.Color.DarkBlue
	}

	class func applyToWindow(window : UIWindow?) {
		if let window = window {
			window.backgroundColor = Theme.Color.DarkBlue
		}
	}

	class func colorWithName(name:String) -> UIColor {
		switch name {
			case "DarkBlue": return Color.DarkBlue
			case "LightBlue": return Color.LightBlue
			case "LightGreen": return Color.LightGreen
			default: return Color.NoColor
		}
	}

}