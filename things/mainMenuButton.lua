local mainMenuButton = {
	name		= 'mainMenu',
	image		= love.graphics.newImage('assets/mainMenuButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
mainMenuButton.width 	= mainMenuButton.image:getWidth()
mainMenuButton.height 	= mainMenuButton.image:getHeight()

return mainMenuButton
