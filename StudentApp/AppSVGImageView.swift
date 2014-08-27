class AppSVGImageView : SVGKFastImageView {

	var imageName : String? {
		didSet {
			if let name = imageName {
				let named = "\(name).svg"
				let image = SVGKImage(named:named)
				super.populateFromImage(image)
			}
		}
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder:aDecoder)
	}

}