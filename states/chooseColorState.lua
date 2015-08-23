local ChooseColorState			= class({})

local blueButton				= require('things/blueButton')
local redButton					= require('things/redButton')
local greenButton				= require('things/greenButton')
local orangeButton				= require('things/orangeButton')
local purpleButton				= require('things/purpleButton')
local yellowButton				= require('things/yellowButton')
local whiteButton				= require('things/whiteButton')
local javaButton				= require('things/javaButton')
local backButton				= require('things/backButton')
local chooseButton				= require('things/chooseButton')
local arrayButtons				= {blueButton,redButton,greenButton,orangeButton,purpleButton,yellowButton,
								whiteButton,javaButton,backButton,chooseButton}

function ChooseColorState:enter()
	local yCoord = 64
	blueButton.x,blueButton.y = 64,yCoord
	redButton.x,redButton.y = 64,yCoord+160
	greenButton.x,greenButton.y = 64,yCoord+2*160
	orangeButton.x,orangeButton.y = 64+320,yCoord
	purpleButton.x,purpleButton.y = 64+320,yCoord+160
	yellowButton.x,yellowButton.y = 64+320,yCoord+2*160
	whiteButton.x,whiteButton.y = 64+2*320,yCoord
	javaButton.x,javaButton.y = 64+320*2,yCoord+160

	backButton.x,backButton.y = 0.25*backButton.width,love.graphics:getHeight()-1.25*backButton.height
	chooseButton.x = love.graphics:getWidth()-1.25*chooseButton.width
	chooseButton.y = love.graphics:getHeight()-1.25*chooseButton.height
	self.monsterColour = 'blue'
end

function ChooseColorState:draw()
	love.graphics.setColor(255,255,255)
	for i,button in ipairs(arrayButtons) do
		love.graphics.draw(button.image,button.x,button.y)
	end
	local colourDescription = ""
	if self.monsterColour == 'blue' then
		colourDescription = "Blue Monster:\n has a wider and longer spray than\n other colors"
	elseif self.monsterColour == 'red' then
		colourDescription = "Red Monster:\n fizzes up slower than other colors, but\n does not lose its fizz naturally"
	elseif self.monsterColour == 'green' then
		colourDescription = "Green Monster:\n fizzes up faster than other colors"
	elseif self.monsterColour == 'orange' then
		colourDescription = "orange Monster:\n fizzes up slightly slower, but sprays\n much slower than other colors"
	elseif self.monsterColour == 'purple' then
		colourDescription = "purple Monster:\n recovers much faster than other colors\n after exploding"
	elseif self.monsterColour == 'yellow' then
		colourDescription = "yellow Monster:\n fizzes up just as fast as other colors,\n but takes much more pressure to explode"
	elseif self.monsterColour == 'white' then
		colourDescription = "White Monster:\n does not contain as much caffeine\n as other colors"
	elseif self.monsterColour == 'java' then
		colourDescription = "Java Monster:\n has a much higher caffeine content then\n other colors"
	end
	love.graphics.setColor(255,255,255)
	love.graphics.print(colourDescription,196,love.graphics:getHeight()-192,0,2,2)
	love.graphics.print("Choose Color State")
end

function ChooseColorState:mousereleased(x, y, mouseButton)
	if mouseButton == 'l' then
		for i,button in ipairs(arrayButtons) do
			if (button.x <= x and x <= button.x + button.width) and (button.y <= y and y <= button.y + button.height) then
				if button.name == 'choose' then
					GameState.switch(LevelState,1,self.monsterColour)
				elseif button.name == 'back' then
					GameState.switch(StartScreenState)
				else
					self.monsterColour = button.name
				end
			end
		end
	end
end

return ChooseColorState
