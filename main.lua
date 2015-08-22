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
local Camera		= require('hump/camera')
local LevelState	= require('states/levelState')
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
