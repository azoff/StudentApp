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
        Github.singleton.onAuthorize = {
            self.performSegueWithIdentifier("push_home", sender: nil)
        }
    }

    @IBAction func onLoginButton() {
        Github.singleton.authorize()
    }

}

