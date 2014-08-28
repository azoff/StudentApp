//
//  Error.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/26/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation

extension CAGradientLayer {

	typealias GradientLayerStop = (NSNumber, UIColor)

	class func prependSublayerTo(parent:CALayer, stops:[GradientLayerStop]) {

		let layer = self()

		layer.cornerRadius = parent.cornerRadius
		layer.frame = parent.bounds
		layer.colors = []
		layer.locations = []

		for stop in stops {
			let (pct, color) = stop
			layer.colors.append(color.CGColor)
			layer.locations.append(pct)
		}

		parent.insertSublayer(layer, atIndex:0)

	}

}