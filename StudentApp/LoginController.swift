//
//  ViewController.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/19/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {

    private let logger = Logger("LoginController")

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: move to application level?
        Github.singleton.onAuthorize = segueToHomeController
        Github.singleton.onError = onLoginError
    }

    override func viewDidAppear(animated:Bool) {
        super.viewDidAppear(animated)
        if Github.singleton.isAuthorized {
            segueToHomeController()
        }
    }

    private func onLoginError(error:NSError) {
        self.logger.error("onLoginError()", error)
    }

    private func segueToHomeController() {
        logger.info("segueToHomeController()", "App authorized, moving to home controller...")
        performSegueWithIdentifier("login_home", sender: self)
    }

    @IBAction func onLoginButton() {
        logger.info("onLoginButton()", "Transferring control to github for authorization...")
        Github.singleton.authorize()
    }

}

