local yellowButton = {
	name		= 'yellow',
	image		= love.graphics.newImage('assets/yellowButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
yellowButton.width 	= yellowButton.image:getWidth()
yellowButton.height 	= yellowButton.image:getHeight()

return yellowButton
