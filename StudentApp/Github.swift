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
    private let oauth : NXOAuth2AccountStore // TODO: should be private...
    var account : NXOAuth2Account?
    var onAuthorize, onDeauthorize : (() -> Void)?
    var onError : ((NSError) -> Void)?


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

            let notifs = NSNotificationCenter.defaultCenter()
            let successEvent = NXOAuth2AccountStoreAccountsDidChangeNotification
            notifs.addObserverForName(successEvent, object: self.oauth, queue: nil) {
                let acct : AnyObject? = $0.userInfo![NXOAuth2AccountStoreNewAccountUserInfoKey]
                if let acct = acct as? NXOAuth2Account {
                    self.account = acct
                    self.onAuthorize?()
                } else {
                    self.onDeauthorize?()
                }
            }

            let failureEvent = NXOAuth2AccountStoreDidFailToRequestAccessNotification
            notifs.addObserverForName(failureEvent, object: self.oauth, queue: nil, usingBlock: {
                let err : AnyObject? = $0.userInfo![NXOAuth2AccountStoreErrorKey]
                if let err = err as? NSError {
                    self.onError?(err)
                }
            })

        } else {
            fatalError("init(): missing github settings")
        }
    }

    func authorize() {
        oauth.requestAccessToAccountWithType(accountType)
    }

    func user(success:((User) -> Void)? = nil, failure:((NSError) -> Void)? = nil) {
        NXOAuth2Request.performMethod("GET",
            onResource: NSURL.URLWithString("https://api.github.com/user"),
            usingParameters: nil,
            withAccount: self.account?,
            sendProgressHandler: nil, // TODO: add a progress handler
            responseHandler: { (_, data : NSData?, error : NSError?) in
                if let error = error {
                    if let fn = failure { fn(error) }
                } else if let data = data {
                    if let fn = success { fn(User(data: data)) }
                }
            });
    }

    func handleRedirectURL(url : NSURL) -> Bool {
        return oauth.handleRedirectURL(url)
    }

    class var singleton : Github {
        struct Static {
            static let instance = Github()
        }
        return Static.instance
    }
    
}