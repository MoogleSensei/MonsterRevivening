local volumeUpButton = {
	name		= 'volumeUp',
	image		= love.graphics.newImage('assets/volumeUp.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
volumeUpButton.width 	= volumeUpButton.image:getWidth()
volumeUpButton.height 	= volumeUpButton.image:getHeight()

return volumeUpButton
