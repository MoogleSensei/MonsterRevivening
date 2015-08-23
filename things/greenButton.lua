local greenButton = {
	name		= 'green',
	image		= love.graphics.newImage('assets/greenButton.png'),
	width		= 0,
	height		= 0,
	x			= 0,
	y			= 0
}
greenButton.width 	= greenButton.image:getWidth()
greenButton.height 	= greenButton.image:getHeight()
greenButton.x		= love.graphics:getWidth()/2 - greenButton.width/2
greenButton.y		= love.graphics:getHeight()/2 - greenButton.height/2

return greenButton
