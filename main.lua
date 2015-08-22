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
local LevelState	= require('states/levelState')
local MenuState 	= require('states/menuState')

function love.load()
	GameState.registerEvents()
	GameState.switch(LevelState,MenuState)
end

function love.draw()

end

function love.update(dt)

end

function math.angle(x1,y1, x2,y2) return math.atan2(y2-y1, x2-x1) end
function math.round(n, deci) deci = 10^(deci or 0) return math.floor(n*deci+.5)/deci end
function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end
