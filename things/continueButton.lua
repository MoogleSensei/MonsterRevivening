local continueButton = {
	name		= 'continue',
	image		= love.graphics.newImage('assets/playButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
continueButton.width 	= continueButton.image:getWidth()
continueButton.height 	= continueButton.image:getHeight()
continueButton.x		= love.graphics:getWidth()/2 - continueButton.width/2
continueButton.y		= love.graphics:getHeight()/2 - continueButton.height/2

return continueButton
