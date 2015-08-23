local HowToState		= class({})

local backButton				= require('things/backButton')

function HowToState:enter()
	backButton.x,backButton.y = 0.25*backButton.width,love.graphics:getHeight()-1.5*backButton.height
end

function HowToState:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(backButton.image,backButton.x,backButton.y)
	-- Draw static image of tutorial
	love.graphics.setColor(255,255,255)
	love.graphics.print("How To State")
end

function HowToState:mousereleased(x, y, mouseButton)
	if mouseButton == 'l' then
		if (backButton.x <= x and x <= backButton.x + backButton.width) and (backButton.y <= y and y <= backButton.y + backButton.height) then
			GameState.switch(StartScreenState)
		end
	end
end

return HowToState
