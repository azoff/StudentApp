//
//  ViewController.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/19/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: move to application level?
        Github.singleton.onAuthorize = segueToHomeController
    }

    override func viewDidAppear(animated:Bool) {
        super.viewDidAppear(animated)
        if Github.singleton.isAuthorized {
            segueToHomeController()
        }
    }

    private func segueToHomeController() {
        performSegueWithIdentifier("login_home", sender: self)
    }

    @IBAction func onLoginButton() {
        Github.singleton.authorize()
    }

}

