local javaButton = {
	name		= 'java',
	image		= love.graphics.newImage('assets/javaButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
javaButton.width 	= javaButton.image:getWidth()
javaButton.height 	= javaButton.image:getHeight()

return javaButton
