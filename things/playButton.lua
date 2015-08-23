local playButton = {
	name		= 'play',
	image		= love.graphics.newImage('assets/playButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
playButton.width 	= playButton.image:getWidth()
playButton.height 	= playButton.image:getHeight()
playButton.x		= love.graphics:getWidth()/2 - playButton.width/2
playButton.y		= love.graphics:getHeight()/2 - playButton.height/2

return playButton
