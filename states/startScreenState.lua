local StartScreenState		= class({})

local playButton				= require('things/playButton')
local howToButton				= require('things/howToButton')
local quitButton				= require('things/quitButton')
local arrayButtons				= {playButton,howToButton,quitButton}

function StartScreenState:enter()
	local yCoord = love.graphics:getHeight()/2
	for i,button in ipairs(arrayButtons) do
		button.x,button.y = 64,yCoord
		yCoord = yCoord + 1.5*button.height
	end
end

function StartScreenState:draw()
	love.graphics.setColor(255,255,255)
	for i,button in ipairs(arrayButtons) do
		love.graphics.draw(button.image,button.x,button.y)
	end
	love.graphics.setColor(255,255,255)
	love.graphics.print("Start Screen State")
end

function StartScreenState:mousereleased(x, y, mouseButton)
	if mouseButton == 'l' then
		for i,button in ipairs(arrayButtons) do
			if (button.x <= x and x <= button.x + button.width) and (button.y <= y and y <= button.y + button.height) then
				if button.name == 'play' then
					GameState.switch(ChooseColorState)
				end
				if button.name == 'howTo' then
					GameState.switch(HowToState)
				end
				if button.name == 'quit' then
					love.event.quit()
				end
			end
		end
	end
end

return StartScreenState
