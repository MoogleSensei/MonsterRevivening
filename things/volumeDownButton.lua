local volumeDownButton = {
	name		= 'volumeDown',
	image		= love.graphics.newImage('assets/volumeDown.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
volumeDownButton.width 	= volumeDownButton.image:getWidth()
volumeDownButton.height 	= volumeDownButton.image:getHeight()

return volumeDownButton
