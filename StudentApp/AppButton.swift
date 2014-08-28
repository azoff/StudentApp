class AppButton : UIButton {

	required init(coder aDecoder: NSCoder) {
		super.init(coder:aDecoder)
	}

	override func awakeFromNib() {
		render()
	}

	// meant to be overridden

	func render() {

	}

	func didHighlight() {

	}

	func didUnhighlight() {

	}

	func didSelect() {

	}

	func didUnselect() {

	}

	override var highlighted : Bool {
		didSet {
			if (highlighted) {
				self.didHighlight()
			} else {
				self.didUnhighlight()
			}
		}
	}

	override var selected : Bool {
		didSet {
			if (selected) {
				self.didSelect()
			} else {
				self.didUnselect()
			}
		}
	}

}