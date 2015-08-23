local VictoryState		= class({})

local mainMenuButton	= require('things/mainMenuButton')
local quitButton		= require('things/quitButton')
local arrayButtons		= {mainMenuButton, quitButton}
local victoryScreen		= love.graphics.newImage('assets/victoryScreen.png')
local score 			= 0

function VictoryState:enter(previous, oldScore)
	local yCoord = love.graphics:getHeight()-96
	mainMenuButton.x,mainMenuButton.y = 32,yCoord
	quitButton.x,quitButton.y = love.graphics:getWidth()-quitButton.width-32,yCoord
	score = oldScore
end

function VictoryState:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(victoryScreen,0,0)
	for i,button in ipairs(arrayButtons) do
		love.graphics.draw(button.image,button.x,button.y)
	end
	love.graphics.setColor(0,255,0)
	love.graphics.print("FINAL SCORE: "..score,love.graphics:getWidth()/2-mainMenuButton.width/2-64,love.graphics:getHeight()-160,0,1.5)
end

function VictoryState:mousereleased(x, y, mouseButton)
	if mouseButton == 'l' then
		for i,button in ipairs(arrayButtons) do
			if (button.x <= x and x <= button.x + button.width) and (button.y <= y and y <= button.y + button.height) then
				if button.name == 'mainMenu' then
					GameState.switch(ChooseColorState)
				end
				if button.name == 'quit' then
					love.event.quit()
				end
			end
		end
	end
end

return VictoryState
