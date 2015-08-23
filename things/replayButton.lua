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
replayButton.x		= love.graphics:getWidth()/2 - replayButton.width/2
replayButton.y		= love.graphics:getHeight()/2 - replayButton.height/2

return replayButton
