local whiteButton = {
	name		= 'white',
	image		= love.graphics.newImage('assets/whiteButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
whiteButton.width 	= whiteButton.image:getWidth()
whiteButton.height 	= whiteButton.image:getHeight()

return whiteButton
