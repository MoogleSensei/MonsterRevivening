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

return playButton
