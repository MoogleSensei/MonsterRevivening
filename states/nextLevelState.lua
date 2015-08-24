local NextLevelState	= class({})

local continueButton	= require('things/continueButton')
local mainMenuButton	= require('things/mainMenuButton')
local quitButton		= require('things/quitButton')
local arrayButtons		= {continueButton,mainMenuButton,quitButton}
local nextLevelScreen	= love.graphics.newImage('assets/nextLevelScreen.png')
local level 			= 0
local monsterColour		= 'blue'
local score 			= 0
local nextSFX = love.audio.newSource("assets/next.wav", "static")

function NextLevelState:enter(previous, oldLevel, oldMonsterColour, oldScore)
	nextSFX:setVolume(globalVolume)
	nextSFX:play()
	level = oldLevel
	monsterColour = oldMonsterColour
	score = oldScore
	local yCoord = love.graphics:getHeight()-128
	continueButton.x,continueButton.y = 32,yCoord
	mainMenuButton.x,mainMenuButton.y = love.graphics:getWidth()/2-mainMenuButton.width/2,yCoord+32
	quitButton.x,quitButton.y = love.graphics:getWidth()-quitButton.width-32,yCoord+32
end

function NextLevelState:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.draw(nextLevelScreen,0,0)
	for i,button in ipairs(arrayButtons) do
		love.graphics.draw(button.image,button.x,button.y)
	end
	love.graphics.setColor(0,255,0)
	love.graphics.print("TOTAL SCORE: "..score,love.graphics:getWidth()/2-mainMenuButton.width/2-64,love.graphics:getHeight()-160,0,1.5)
end

function NextLevelState:mousereleased(x, y, mouseButton)
	if mouseButton == 'l' then
		for i,button in ipairs(arrayButtons) do
			if (button.x <= x and x <= button.x + button.width) and (button.y <= y and y <= button.y + button.height) then
				if button.name == 'continue' then
					nextSFX:stop()
					GameState.switch(LevelState,level,monsterColour,score)
				end
				if button.name == 'mainMenu' then
					nextSFX:stop()
					GameState.switch(StartScreenState)
				end
				if button.name == 'quit' then
					love.event.quit()
				end
			end
		end
	end
end

return NextLevelState
