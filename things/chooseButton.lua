local chooseButton = {
	name		= 'choose',
	image		= love.graphics.newImage('assets/chooseButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
chooseButton.width 	= chooseButton.image:getWidth()
chooseButton.height 	= chooseButton.image:getHeight()

return chooseButton
