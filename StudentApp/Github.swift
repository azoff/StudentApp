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
    
    private let accountType = "Github"
    let oauth : NXOAuth2AccountStore

    init() {
        if let dict = Credentials.dict(accountType) {
            oauth = NXOAuth2AccountStore.sharedStore() as NXOAuth2AccountStore
            let config = NSMutableDictionary()
            config[kNXOAuth2AccountStoreConfigurationClientID] = dict["client_id"]!
            config[kNXOAuth2AccountStoreConfigurationSecret] = dict["client_secret"]!
            config[kNXOAuth2AccountStoreConfigurationAuthorizeURL] = NSURL.URLWithString(dict["authorize_uri"]!)
            config[kNXOAuth2AccountStoreConfigurationTokenURL] = NSURL.URLWithString(dict["token_uri"]!)
            config[kNXOAuth2AccountStoreConfigurationRedirectURL] = NSURL.URLWithString(dict["redirect_uri"]!)
            oauth.setConfiguration(config, forAccountType:accountType)
        } else {
            fatalError("init(): missing github settings")
        }
    }

    func authorize() {
        oauth.requestAccessToAccountWithType(accountType)
    }
    
    func handleRedirectURL(url : NSURL) {
        oauth.handleRedirectURL(url)
    }
    
    class var singleton : Github {
        struct Static {
            static let instance = Github()
        }
        return Static.instance
    }
    
}