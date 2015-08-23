local MenuState			= class({})

local continueButton	= require('things/continueButton')
local mainMenuButton	= require('things/mainMenuButton')
local quitButton		= require('things/quitButton')
-- local volumeUpButton	= require('things/volumeUpButton')
-- local volumeDownButton	= require('things/volumeDownButton')
local arrayButtons		= {continueButton,mainMenuButton,quitButton}
local menuScreen		= love.graphics.newImage('assets/menuScreen.png')

function MenuState:enter()
	continueButton.x,continueButton.y = 32,love.graphics:getHeight()-1.75*quitButton.height
	mainMenuButton.x,mainMenuButton.y = love.graphics:getWidth()/2-mainMenuButton.width/2,love.graphics:getHeight()-1.75*quitButton.height
	quitButton.x,quitButton.y = love.graphics:getWidth()-quitButton.width-32,love.graphics:getHeight()-1.75*quitButton.height
end

function MenuState:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(menuScreen,0,0)
	for i,button in ipairs(arrayButtons) do
		love.graphics.draw(button.image,button.x,button.y)
	end
end

function MenuState:mousereleased(x, y, mouseButton)
	if mouseButton == 'l' then
		for i,button in ipairs(arrayButtons) do
			if (button.x <= x and x <= button.x + button.width) and (button.y <= y and y <= button.y + button.height) then
				if button.name == 'continue' then
					GameState.pop()
				end
				if button.name == 'mainMenu' then
					GameState.switch(StartScreenState)
				end
				if button.name == 'quit' then
					love.event.quit()
				end
			end
		end
	end
end

return MenuState
