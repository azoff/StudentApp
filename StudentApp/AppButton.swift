class AppButton : UIButton {

	var normalTitleThemedColorName : String? {
		didSet {
			if let name : String = normalTitleThemedColorName {
				let color : UIColor = Theme.colorWithName(name)
				setTitleColor(color, forState:UIControlState.Normal)
			}
		}
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder:aDecoder)
	}

}