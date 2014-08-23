//
//  ViewController.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/19/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LoginController: BaseViewController {
    
    private let notifs = NSNotificationCenter.defaultCenter()
    private var success, failure : NSObjectProtocol?

    @IBAction func onLoginButton() {
        Github.singleton.authorize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: This should move to the application level...
        let successEvent = NXOAuth2AccountStoreAccountsDidChangeNotification
        success = notifs.addObserverForName(successEvent, object: Github.singleton.oauth, queue: nil) {
            let acct : AnyObject? = $0.userInfo![NXOAuth2AccountStoreNewAccountUserInfoKey]
            self.performSegueWithIdentifier("push_home", sender: acct) // TODO: may be null...
        }
        let failureEvent = NXOAuth2AccountStoreDidFailToRequestAccessNotification
        failure = notifs.addObserverForName(failureEvent, object: Github.singleton.oauth, queue: nil) {
            println("OAUTH ERROR \($0)")
        }
    }

    override func didReceiveMemoryWarning() {
        if let success = success {
            notifs.removeObserver(success)
        }
        if let failure = failure {
            notifs.removeObserver(failure)
        }
    }

}

