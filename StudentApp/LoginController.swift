//
//  ViewController.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/19/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {
    
    @IBAction func onLoginButton() {
        Github.singleton.authorize(
            authorized: {
                self.performSegueWithIdentifier("push_home", sender: $0)
            }, failure: {
                println("OAUTH ERROR \($0)")
            }
        )
    }

}

