//
//  HomeController.swift
//  StudentApp
//
//  Created by Jonathan Azoff on 8/20/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class HomeController: AppViewController {

	@IBOutlet weak var label: UILabel!

	private let logger = Logger("HomeController")

	override func viewDidLoad() {
		super.viewDidLoad()
		User.current(success: {
			self.label.text = "Hello \($0.firstName!)!"
		}, failure: {
			self.logger.error("failure()", $0)
		})
	}

}
