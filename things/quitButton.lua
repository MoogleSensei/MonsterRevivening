local quitButton = {
	name		= 'quit',
	image		= love.graphics.newImage('assets/quitButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
quitButton.width 	= quitButton.image:getWidth()
quitButton.height 	= quitButton.image:getHeight()

return quitButton
