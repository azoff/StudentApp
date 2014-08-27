class LogoImageView : SVGKFastImageView {

	override init() {
		super.init(SVGKImage:SVGKImage(named:"codepath.svg"))
	}

	required init(coder aDecoder: NSCoder) {
	    super.init(coder:aDecoder)
	}

}