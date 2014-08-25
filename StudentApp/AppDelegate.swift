//
//  AppDelegate.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/19/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    private func initWindow() {
        window?.backgroundColor = Theme.Color.WindowBackground
    }

    func application(application: UIApplication!, openURL url: NSURL!,
        sourceApplication: String!, annotation: AnyObject!) -> Bool {
        return Github.singleton.handleRedirectURL(url)
    }
    
    func application(application: UIApplication!,
        didFinishLaunchingWithOptions launchOptions: NSDictionary!) -> Bool {
        initWindow()
        return ParseApp.singleton.trackLaunch(launchOptions)
    }


}

