local purpleButton = {
	name		= 'purple',
	image		= love.graphics.newImage('assets/purpleButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
purpleButton.width 	= purpleButton.image:getWidth()
purpleButton.height 	= purpleButton.image:getHeight()

return purpleButton
