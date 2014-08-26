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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        User.current {
            self.label.text = "Hello \($0!.firstName!)!"
        }
    }

}
