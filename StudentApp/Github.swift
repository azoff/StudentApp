//
//  GithubOAuth.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/20/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation
import UIKit

class Github  {
    
    let serviceName : String = "Github"

    init() {
        if let config = Credentials.dict(serviceName) {
            let store = NXOAuth2AccountStore.sharedStore() as NXOAuth2AccountStore
            store.setConfiguration(config, forAccountType:serviceName);

        } else {
            fatalError("init(): missing github settings")
        }
    }
    
    func authorize() {
        
    }
    
    func handleRedirectURL(url : NSURL) {
        
    }
    
    class var singleton : Github {
        struct Static {
            static let instance = Github()
        }
        return Static.instance
    }
    
}