class GithubButton : AppButton {

	override func render() {

		setTitleColor(UIColor.blackColor(), forState:UIControlState.Normal)
		setTitleColor(UIColor.blackColor(), forState:UIControlState.Highlighted)
		setTitleColor(UIColor.blackColor(), forState:UIControlState.Selected)
		backgroundColor = UIColor(hue:0, saturation:0, brightness:0.961, alpha:1)

		layer.cornerRadius = 2

		layer.shadowColor = UIColor.blackColor().CGColor;
		layer.shadowOffset = CGSizeMake(0,0);
		layer.shadowOpacity = 0.8;
		layer.shadowRadius = 5

		let paddingHorizontal : CGFloat = 22
		let paddingVertical : CGFloat = paddingHorizontal / 2

		contentEdgeInsets = UIEdgeInsetsMake(
			paddingVertical,    // top
			paddingHorizontal + paddingVertical + 22,  // left
			paddingVertical,    // bottom
			paddingHorizontal   // right
		)

		let icon = SVGKLayer()
		icon.frame = CGRectMake(12, 6, 0, 0)
		icon.SVGImage = SVGKImage(named:"github.svg")
		layer.addSublayer(icon)

        CAGradientLayer.prependSublayerTo(layer, stops: [
			(0.95, UIColor(white:0, alpha:0)),
			(0.975, UIColor(white:0, alpha:0.1)),
			(1, UIColor(white:0, alpha:0.1))
		]);

		CAGradientLayer.prependSublayerTo(layer, stops: [
			(0.025, UIColor(white:1, alpha:0.3)),
			(0.05, UIColor(white:1, alpha:0))
		]);

	}

}