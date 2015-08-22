local quitButton = {
	name		= 'quit',
	image		= love.graphics.newImage('assets/quitButton.png'),
	width,--		= 0,
	height,--		= 0,
	x,--			= 0,
	y--			= 0
}
quitButton.width 	= quitButton.image:getWidth()
quitButton.height 	= quitButton.image:getHeight()
quitButton.x		= love.graphics:getWidth()/2 - quitButton.width/2
quitButton.y		= love.graphics:getHeight()/2 - quitButton.height/2 + quitButton.height*2

return quitButton
