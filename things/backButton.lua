local backButton = {
	name		= 'back',
	image		= love.graphics.newImage('assets/backButton.png'),
	width,--		= 0,
	height,--		= 0,
	x,--			= 0,
	y--			= 0
}
backButton.width 	= backButton.image:getWidth()
backButton.height 	= backButton.image:getHeight()
backButton.x		= love.graphics:getWidth()/2 - backButton.width/2
backButton.y		= love.graphics:getHeight()/2 - backButton.height/2 + backButton.height*2

return backButton
