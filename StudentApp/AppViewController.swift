//
//  BaseViewController.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/20/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class AppViewController : UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		Theme.applyToRootView(view)
	}

	func viewFade(duration:NSTimeInterval, alpha:CGFloat) {
		UIView.animateWithDuration(duration) {
			self.view.alpha = alpha
		}
	}

	func viewFadeIn(duration:NSTimeInterval) {
        viewFade(duration, alpha:1.0)
	}

	func viewFadeOut(duration:NSTimeInterval) {
        viewFade(duration, alpha:0.0)
	}

}
