local Monster	  = {}

--Load-type stuff
Monster.x = love.graphics:getWidth()/2
Monster.y = love.graphics:getHeight()/2
Monster.firing = false
Monster.theta = 0
if monsterColour == "blue" then

elseif monsterColour == "red" then

else
    Monster.image = love.graphics.newImage('assets/greenMonster.png')
end
Monster.width = Monster.image:getWidth()
Monster.height = Monster.image:getHeight()

function Monster:draw()
	love.graphics.draw(Monster.image,Monster.x,Monster.y,Monster.theta,1,1,Monster.width/2,Monster.height/2)
end

function Monster:pointMonsterToMouse()
    local mouseX,mouseY = love.mouse.getPosition()
    Monster.theta = math.angle(love.graphics:getWidth()/2,love.graphics:getHeight()/2,mouseX,mouseY)+math.pi/2
    if math.pi <= Monster.theta then
        Monster.theta = Monster.theta - 2*math.pi
    end
end

function Monster:moveMonster(dir)
    if dir == 'up' then
        Monster.y = Monster.y - 10
    elseif dir == 'left' then
        Monster.x = Monster.x - 10
    elseif dir == 'down' then
        Monster.y = Monster.y + 10
    elseif dir == 'right' then
        Monster.x = Monster.x + 10
    end
end

return Monster
