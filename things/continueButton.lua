local continueButton = {
	name		= 'continue',
	image		= love.graphics.newImage('assets/continueButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
continueButton.width 	= continueButton.image:getWidth()
continueButton.height 	= continueButton.image:getHeight()

return continueButton
