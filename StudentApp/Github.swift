//
//  GithubOAuth.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/20/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import Foundation
import UIKit

class Github : OAuth2CodeGrant {
    
    init() {
        if let settings = Credentials.dict("Github") {
            super.init(settings: settings)
        } else {
            fatalError("init(): missing github settings")
        }
    }
    
    func authorize(authorized _authorized:((parameters: NSDictionary) -> Void), failure _failure:((error: NSError) -> Void)) {
        onFailure = _failure
        onAuthorize = _authorized
        let url = self.authorizeURLWithRedirect(Info.callbackUrl, scope: "", params: nil)
        UIApplication.sharedApplication().openURL(url)
    }
    
    class var singleton : Github {
        struct Static {
            static let instance = Github()
        }
        return Static.instance
    }
    
}
