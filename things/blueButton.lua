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
blueButton.x		= love.graphics:getWidth()/2 - blueButton.width/2
blueButton.y		= love.graphics:getHeight()/2 - blueButton.height/2

return blueButton
