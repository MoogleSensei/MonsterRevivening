local orangeButton = {
	name		= 'orange',
	image		= love.graphics.newImage('assets/orangeButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
orangeButton.width 	= orangeButton.image:getWidth()
orangeButton.height 	= orangeButton.image:getHeight()

return orangeButton
