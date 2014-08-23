//
//  HomeController.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/20/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class HomeController: BaseViewController {

    @IBOutlet weak var label: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // illustrates an authenticated oauth request...
//        let url = NSURL(string: "https://api.github.com/user")
//        let req = Github.singleton.request(forURL: url)
//        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
//            if nil != error {
//                println("OAUTH REQUEST ERROR \(error)")
//            } else {
//                let text = NSString(data: data, encoding: NSUTF8StringEncoding)
//                self.label.text = text
//                self.label.textColor = UIColor.whiteColor()
//            }
//        }
    }

}
