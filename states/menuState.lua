local MenuState			= class({})

local continueButton	= require('things/continueButton')
local mainMenuButton	= require('things/mainMenuButton')
local quitButton		= require('things/quitButton')
local musicButton		= require('things/musicButton')
local volumeUpButton	= require('things/volumeUpButton')
local volumeDownButton	= require('things/volumeDownButton')
local arrayButtons		= {continueButton,mainMenuButton,quitButton,musicButton,volumeUpButton,volumeDownButton}
local menuScreen		= love.graphics.newImage('assets/menuScreen.png')
local musicImage = love.graphics.newImage('assets/musicIsOn.png')

function MenuState:enter()
	continueButton.x,continueButton.y = 32,love.graphics:getHeight()-1.75*quitButton.height
	mainMenuButton.x,mainMenuButton.y = love.graphics:getWidth()/2-mainMenuButton.width/2,love.graphics:getHeight()-1.75*quitButton.height
	quitButton.x,quitButton.y = love.graphics:getWidth()-quitButton.width-32,love.graphics:getHeight()-1.75*quitButton.height
	musicButton.x,musicButton.y = 224,love.graphics:getHeight()/2+1.5*musicButton.height
	volumeUpButton.x,volumeUpButton.y = 64,love.graphics:getHeight()/2+volumeUpButton.height
	volumeDownButton.x,volumeDownButton.y = 64,love.graphics:getHeight()/2+2.5*volumeDownButton.height
end

function MenuState:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(menuScreen,0,0)
	for i,button in ipairs(arrayButtons) do
		love.graphics.draw(button.image,button.x,button.y)
	end
	love.graphics.setColor(0,255,0)
	love.graphics.print("Volume",64,love.graphics:getHeight()/2-16,0,2)
end

function MenuState:mousereleased(x, y, mouseButton)
	if mouseButton == 'l' then
		for i,button in ipairs(arrayButtons) do
			if (button.x <= x and x <= button.x + button.width) and (button.y <= y and y <= button.y + button.height) then
				if button.name == 'continue' then
					GameState.pop()
				end
				if button.name == 'volumeUp' then
					globalVolume = globalVolume + 0.1
					if 1 <= globalVolume then
						globalVolume = 1
					end
					musicSFX:setVolume(globalVolume)
				end
				if button.name == 'volumeDown' then
					globalVolume = globalVolume - 0.1
					if globalVolume <= 0 then
						globalVolume = 0
					end
					musicSFX:setVolume(globalVolume)
				end
				if button.name == 'music' then
					chooseMusic = not(chooseMusic)
					if chooseMusic then
						musicButton.image = love.graphics.newImage('assets/musicIsOn.png')
						if not(coughSFX:isPlaying()) then
							musicSFX:play()
						end
					else
						musicButton.image = love.graphics.newImage('assets/musicIsOff.png')
						musicSFX:stop()
					end
				end
				if button.name == 'mainMenu' then
					musicSFX:stop()
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
