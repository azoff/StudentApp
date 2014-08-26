//
//  HomeController.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/20/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class HomeController: BaseViewController {

    @IBOutlet weak var label: UILabel!

    private let logger = Logger("HomeController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logger.info("viewDidLoad()", "Loading user session...")
        User.current(success: {
            self.logger.info("viewDidLoad()", "Found user \($0.objectId)!")
            self.label.text = "Hello \($0.firstName!)!"
        }, failure: {
            self.logger.error("failure()", $0)
        })
    }

}
