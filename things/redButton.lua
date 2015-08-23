local redButton = {
	name		= 'red',
	image		= love.graphics.newImage('assets/redButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
redButton.width 	= redButton.image:getWidth()
redButton.height 	= redButton.image:getHeight()

return redButton
