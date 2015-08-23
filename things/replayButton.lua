local replayButton = {
	name		= 'replay',
	image		= love.graphics.newImage('assets/replayButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
replayButton.width 	= replayButton.image:getWidth()
replayButton.height = replayButton.image:getHeight()

return replayButton
