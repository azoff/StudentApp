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

    private let logger = Logger("Github")
    private let accountType = "Github"
    private let oauth : NXOAuth2AccountStore // TODO: should be private...
    private var _account : NXOAuth2Account?
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
                self.account = $0.userInfo?[NXOAuth2AccountStoreNewAccountUserInfoKey] as? NXOAuth2Account
            }

            let failureEvent = NXOAuth2AccountStoreDidFailToRequestAccessNotification
            notifs.addObserverForName(failureEvent, object: self.oauth, queue: nil, usingBlock: {
                let err : AnyObject? = $0.userInfo![NXOAuth2AccountStoreErrorKey]
                if let err = err as? NSError {
                    self.onError?(err)
                }
            })

            self.syncKeychain()

        } else {

            logger.fatal("init()", "missing or invalid github settings")
            fatalError("FIXME")
        }

    }

    var account : NXOAuth2Account? {
        didSet {
            if account != nil {
                self.onAuthorize?()
            } else {
                self.onDeauthorize?()
            }
        }
    }

    func authorize() {
        oauth.requestAccessToAccountWithType(accountType)
    }

    var isAuthorized : Bool {
        return account != nil
    }

    private func syncKeychain() {
        for obj in oauth.accountsWithAccountType(accountType) {
            self.account = obj as? NXOAuth2Account
            break
        }
    }

    func user(success:((User) -> Void)? = nil, failure:((NSError) -> Void)? = nil) {
        NXOAuth2Request.performMethod("GET",
            onResource: NSURL.URLWithString("https://api.github.com/user"),
            usingParameters: nil,
            withAccount: self.account?,
            sendProgressHandler: nil, // TODO: add a progress handler
            responseHandler: { (_, data : NSData?, error : NSError?) in
                if let error = error {
                    failure?(error)
                } else if let data = data {
                    if let user = User.object(data) {
                        success?(user)
                    } else {
                        failure?(Error("Unable to parse network data", domain:"GithubDomain"))
                    }
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