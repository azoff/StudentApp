//
//  ViewController.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/19/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LoginController : AppViewController {

	private let logger = Logger("LoginController")

	override func viewDidLoad() {
		super.viewDidLoad()
		Github.singleton.onAuthorize = segueToHomeController
		Github.singleton.onError = onLoginError
	}

	override func viewDidAppear(animated:Bool) {
		super.viewDidAppear(animated)
		if Github.singleton.isAuthorized {
			segueToHomeController()
		} else {
			viewFadeIn(1)
		}
	}

	private func onLoginError(error:NSError) {
		self.logger.error("onLoginError()", error)
	}

	private func segueToHomeController() {
        viewFadeOut(0.5)
		logger.info("segueToHomeController()", "Segue to home controller...")
		performSegueWithIdentifier("login_home", sender: self)
	}

	@IBAction func onLoginButton() {
        viewFadeOut(0.5)
		logger.info("onLoginButton()", "Login button tapped!")
		Github.singleton.authorize()
	}

}

