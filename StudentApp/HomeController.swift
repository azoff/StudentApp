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
        Github.singleton.user {
            println($0.json)
        }
    }

}
