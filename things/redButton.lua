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
redButton.x		= love.graphics:getWidth()/2 - redButton.width/2
redButton.y		= love.graphics:getHeight()/2 - redButton.height/2

return redButton
