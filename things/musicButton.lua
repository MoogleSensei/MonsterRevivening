local musicButton = {
	name		= 'music',
	image		= love.graphics.newImage('assets/musicIsOn.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
musicButton.width 	= musicButton.image:getWidth()
musicButton.height 	= musicButton.image:getHeight()

return musicButton
