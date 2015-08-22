local LevelState    = class({})

function LevelState:init()
    self.level = 0
    self.lastKeyTimer = 0
    self.playerX = love.graphics:getWidth()/2
    self.playerY = love.graphics:getHeight()/2
    self.map = love.graphics.newImage('assets/ludumDare33.png')
    local Camera = require('hump/camera')
    self.cam = Camera(self.playerX,self.playerY)
    self.enemies = {}
    self.fizzCharge = 0
    self.fizzChargeRate = -2
    for i=1,10 do
        self.enemies[i] = {x = math.random(self.map:getWidth()),y = math.random(self.map:getHeight()),image = love.graphics.newImage('assets/sleeper.png')}
    end
end

function LevelState:enter(previous, menuState, monsterColour)
    self.menu = menuState
    if monsterColour == "blue" then

    elseif monsterColour == "red" then

    else
        self.monsterGraphic = love.graphics.newImage('assets/greenMonster.png')
    end
end

function LevelState:update(dt)
    self.lastKeyTimer = self.lastKeyTimer + 1
    if love.keyboard.isDown('w') or love.keyboard.isDown('up')      then self:movePlayer('up') end
    if love.keyboard.isDown('a') or love.keyboard.isDown('left')    then self:movePlayer('left') end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down')    then self:movePlayer('down') end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right')   then self:movePlayer('right') end
    if 100 <= self.lastKeyTimer then
        self.fizzChargeRate = -2
    end
    self.fizzCharge = self.fizzCharge + self.fizzChargeRate
    if self.fizzCharge <= 0 then
        self.fizzCharge = 0
    elseif 1000 <= self.fizzCharge then
        self.fizzCharge = 1000
    end
    self.cam:lookAt(self.playerX,self.playerY)
end

function LevelState:draw()
    love.graphics.setColor(255,255,255)
    self.cam:attach()
    love.graphics.draw(self.map,0,0)
    for i,enemy in ipairs(self.enemies) do
        love.graphics.draw(enemy.image,enemy.x,enemy.y)
    end
    love.graphics.draw(self.monsterGraphic,self.playerX-self.monsterGraphic:getWidth()/2,self.playerY-self.monsterGraphic:getHeight()/2)
    self.cam:detach()
    love.graphics.setColor(0,255,0)
    love.graphics.print("LEVEL STATE",0,0)
    love.graphics.print("Charge: "..self.fizzCharge,0,16)
end

function LevelState:enterMenu()
    GameState.push(self.menu)
end

function LevelState:keypressed(key)
    if key == 'w' or key == 'up' or key == 'a' or key == 'left' or key == 's' or key == 'down' or key == 'd' or key == 'right' then
        if self.lastKeyTimer <= 10 then
            -- Set charge rate to +
            self.fizzChargeRate = 3
        else
            -- Set charge rate to 0
            self.fizzChargeRate = 0
        end
        self.lastKeyTimer = 0
    end
end

function LevelState:keyreleased(key)
    if key == 'escape' then self:enterMenu() end
end

function LevelState:movePlayer(dir)
    if dir == 'up' then
        self.playerY = self.playerY - 10
    elseif dir == 'left' then
        self.playerX = self.playerX - 10
    elseif dir == 'down' then
        self.playerY = self.playerY + 10
    elseif dir == 'right' then
        self.playerX = self.playerX + 10
    end
    if self.playerX - self.monsterGraphic:getWidth()/2 <= 0 then
        self.playerX = self.monsterGraphic:getWidth()/2
    elseif self.map:getWidth() <= self.playerX + self.monsterGraphic:getWidth()/2 then
        self.playerX = self.map:getWidth() - self.monsterGraphic:getWidth()/2
    end
    if self.playerY - self.monsterGraphic:getHeight()/2 <= 0 then
        self.playerY = self.monsterGraphic:getHeight()/2
    elseif self.map:getHeight() <= self.playerY + self.monsterGraphic:getHeight()/2 then
        self.playerY = self.map:getHeight() - self.monsterGraphic:getHeight()/2
    end
end

function LevelState:mousepressed(x, y, button)
    if button == "l" then
        local mouseX = x
        local mouseY = y
        local r = math.dist(mouseX,mouseY,love.graphics:getWidth()/2,love.graphics:getHeight()/2)
        local theta = -math.angle(love.graphics:getWidth()/2,love.graphics:getHeight()/2,mouseX,mouseY)
        print(r.."   "..theta*180/math.pi)
        print("RELEASE THOSE MONSTER JUICES")
    end
end

function LevelState:focus(f)
    if not f then
        GameState.push(self.menu)
    end
end

return LevelState
