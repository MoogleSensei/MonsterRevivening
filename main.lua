-- Monster: Revivening
-- Ludum Dare 33
-- You are the Monster
--
-- Written by Sean Miller
-- 08/21/2015
--
-- This is my 48 hour Ludum Dare 33 Compo entry.
-- It's for my second ever Ludum Dare!
-- This game is an entirely satirical work, I have no stock in and am in no way related to Monster energy drink.
class				= require('hump/class')
GameState 			= require('hump/gamestate')
StartScreenState 	= require('states/startScreenState')
HowToState 			= require('states/howToState')
ChooseColorState 	= require('states/chooseColorState')
LevelState			= require('states/levelState')
MenuState 			= require('states/menuState')
VictoryState 		= require('states/victoryState')
volumesList			= {[0] = 0, [1] = 0.1, [2] = 0.2, [3] = 0.3}
volume				= 5	-- Initially volume set at 50%

function love.load()
	GameState.registerEvents()
	GameState.switch(StartScreenState)
end

function love.draw()

end

function love.update(dt)

end

function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end
function math.round(n, deci) deci = 10^(deci or 0) return math.floor(n*deci+.5)/deci end
function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
