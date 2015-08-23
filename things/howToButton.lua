local howToButton = {
	name		= 'howTo',
	image		= love.graphics.newImage('assets/howToButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
howToButton.width 	= howToButton.image:getWidth()
howToButton.height 	= howToButton.image:getHeight()
howToButton.x		= love.graphics:getWidth()/2 - howToButton.width/2
howToButton.y		= love.graphics:getHeight()/2 - howToButton.height/2

return howToButton
