local ChooseColorState			= class({})

local blueButton				= require('things/blueButton')
local redButton					= require('things/redButton')
local greenButton				= require('things/greenButton')
local backButton				= require('things/backButton')
local chooseButton				= require('things/chooseButton')
local arrayButtons				= {blueButton,redButton,greenButton,backButton,chooseButton}

function ChooseColorState:enter()
	local yCoord = 64
	blueButton.x,blueButton.y = 64,yCoord
	redButton.x,redButton.y = 64,yCoord+160
	greenButton.x,greenButton.y = 64,yCoord+2*160

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
		colourDescription = "Red Monster:\n has a more resilient fizz meter so it will\n last longer than other colors"
	elseif self.monsterColour == 'green' then
		colourDescription = "Green Monster:\n fizzes up faster than other colors"
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
