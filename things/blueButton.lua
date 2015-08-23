local blueButton = {
	name		= 'blue',
	image		= love.graphics.newImage('assets/blueButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
blueButton.width 	= blueButton.image:getWidth()
blueButton.height 	= blueButton.image:getHeight()

return blueButton
