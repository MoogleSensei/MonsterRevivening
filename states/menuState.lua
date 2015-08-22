local MenuState		= class({})

continueButton		= require('things/continueButton')
quitButton			= require('things/quitButton')
arrayButtons		= {continueButton, quitButton}

function MenuState:init()

end

function MenuState:enter(previous)

end

function MenuState:update(dt)

end

function MenuState:draw()
	love.graphics.setColor(255,255,255)
	love.graphics.print('Menu State',0,0)
	for i,button in ipairs(arrayButtons) do
		love.graphics.draw(button.image,button.x,button.y)
	end
end

function MenuState:exitMenu()
	GameState.pop()
end

function MenuState:keyreleased(key)
	-- if key == 'escape'	then self:exitMenu() end
end

function MenuState:mousereleased(x, y, mouseButton)
	if mouseButton == 'l' then
		for i,button in ipairs(arrayButtons) do
			if (button.x <= x and x <= button.x + button.width) and (button.y <= y and y <= button.y + button.height) then
				if button.name == 'quit' then
					love.event.quit()
				end
				if button.name == 'continue' then
					self:exitMenu()
				end
			end
		end
	end
end

return MenuState
