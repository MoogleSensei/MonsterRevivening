local LevelState    = class({})
local Sleeper       = require('things/sleeper')

function LevelState:init()
    self.level = 0
    self.lastKeyTimer = 0
    self.monster = require('things/monster')
    self.monster.x = love.graphics:getWidth()/2
    self.monster.y = love.graphics:getHeight()/2
    self.map = love.graphics.newImage('assets/ludumDare33.png')
    local Camera = require('hump/camera')
    self.cam = Camera(self.monster.x,self.monster.y)
    self.enemies = {}
    self.fizzCharge = 0
    self.fizzChargeRate = -2
    self.fizzMaxSafe = 1000
    self.fizzMax = 1250
    self.firing = false
    for i=1,20 do
        self.enemies[i] = Sleeper(self.map:getWidth(),self.map:getHeight())
    end
    self.gaugeGraphic = love.graphics.newImage('assets/gauge.png')
end

function LevelState:enter(previous, menuState, monsterColour)
    self.menu = menuState
    if monsterColour == "blue" then

    elseif monsterColour == "red" then

    else
        self.monster.image = love.graphics.newImage('assets/greenMonster.png')
    end
end

function LevelState:update(dt)
    self.monster:pointMonsterToMouse()
    self.lastKeyTimer = self.lastKeyTimer + 1
    if love.keyboard.isDown('w') or love.keyboard.isDown('up')      then self.monster:moveMonster('up') end
    if love.keyboard.isDown('a') or love.keyboard.isDown('left')    then self.monster:moveMonster('left') end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down')    then self.monster:moveMonster('down') end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right')   then self.monster:moveMonster('right') end
    self:checkBounds()
    for i,enemy in ipairs(self.enemies) do
        enemy:update(dt)
    end
    if self.firing and 0 < self.fizzCharge then
        self.fizzChargeRate = -10
        self:checkEnemySprayed()
    else
        if 100 <= self.lastKeyTimer then
            self.fizzChargeRate = -3
        elseif 30 <= self.lastKeyTimer then
            self.fizzChargeRate = 0
        end
    end
    self.fizzCharge = self.fizzCharge + self.fizzChargeRate
    if self.fizzCharge <= 0 then
        self.fizzCharge = 0
    elseif self.fizzMax <= self.fizzCharge then
        self.fizzCharge = self.fizzMax
    end
    self.fizzPercent = self.fizzCharge/self.fizzMaxSafe
    self.fizzPercentDanger = (self.fizzCharge-self.fizzMaxSafe)/(self.fizzMax-self.fizzMaxSafe)
    if self.fizzPercentDanger <= 0 then
        self.fizzPercentDanger = 0
    end
    if 1 <= self.fizzPercent then
        self.fizzPercent = 1
    end
    self.cam:lookAt(self.monster.x,self.monster.y)
end

function LevelState:draw()
    love.graphics.setColor(255,255,255)
    self.cam:attach()
    love.graphics.draw(self.map,0,0)
    for i,enemy in ipairs(self.enemies) do
        love.graphics.draw(enemy.image,enemy.x,enemy.y,0,1,1,enemy.width/2,enemy.height/2)
    end
    self.monster:draw()
    self.cam:detach()
    self:drawGauge(self.fizzCharge,self.fizzMax)
    love.graphics.setColor(0,255,0)
    love.graphics.print("LEVEL STATE",0,0)
end

function LevelState:drawGauge(currentFizz,maxFizz)
    love.graphics.setColor(255,255,255)
    local gaugeX, gaugeY = love.graphics:getWidth()/2-128,love.graphics:getHeight()-64
    local gaugeWidth, gaugeHeight = self.gaugeGraphic:getWidth(),self.gaugeGraphic:getHeight()
    love.graphics.rectangle("fill",gaugeX,gaugeY,gaugeWidth,gaugeHeight)
    if 1 <= self.fizzPercent then
        love.graphics.setColor(255,0,0)
    else
        love.graphics.setColor(0,255,0)
    end
    love.graphics.rectangle("fill",gaugeX,gaugeY,self.fizzPercent*200 + self.fizzPercentDanger*56,gaugeHeight)
    love.graphics.setColor(255,255,255)
    love.graphics.draw(self.gaugeGraphic,gaugeX,gaugeY)
end

function LevelState:checkBounds()
     if self.monster.x<= 0 or self.map:getWidth() <= self.monster.x then
        -- print("MONSTER IS LOSING")
    end
    if self.monster.y <= 0 or self.map:getHeight() <= self.monster.y then
        -- print("MONSTER IS LOSING")
    end
end

function LevelState:checkEnemySprayed()
    for i,enemy in ipairs(self.enemies) do
        local onScreenX,onScreenY = enemy.x-self.cam.x+love.graphics:getWidth()/2,enemy.y-self.cam.y+love.graphics:getHeight()/2
        if 0 <= onScreenX+enemy.width/2 and onScreenX-enemy.width/2 <= love.graphics:getWidth() and 0 <= onScreenY+enemy.height/2 and onScreenY-enemy.height/2 <= love.graphics:getHeight() then
            local enemyAngle = math.angle(love.graphics:getWidth()/2,love.graphics:getHeight()/2,onScreenX,onScreenY)+math.pi/2
            if math.pi <= enemyAngle then
                enemyAngle = enemyAngle - 2*math.pi
            end
            if self.monster.theta - math.pi/8 <= enemyAngle and enemyAngle <= self.monster.theta + math.pi/8 then
                local enemyAngle = enemyAngle-math.pi/2
                if enemyAngle <= -math.pi then
                    enemyAngle = enemyAngle + 2*math.pi
                end
                enemy:getSprayed(self.fizzPercent+self.fizzPercentDanger,enemyAngle)
            end
        end
    end
end

function LevelState:enterMenu()
    GameState.push(self.menu)
end

function LevelState:keypressed(key)
    if key == 'w' or key == 'up' or key == 'a' or key == 'left' or key == 's' or key == 'down' or key == 'd' or key == 'right' then
        if self.lastKeyTimer <= 10 then
            self.fizzChargeRate = 3
        else
            self.fizzChargeRate = 0
        end
        self.lastKeyTimer = 0
    end
end

function LevelState:keyreleased(key)
    if key == 'escape' then self:enterMenu() end
end

function LevelState:mousepressed(x, y, button)
    if button == "l" then
        local mouseX = x
        local mouseY = y
        local r = math.dist(mouseX,mouseY,love.graphics:getWidth()/2,love.graphics:getHeight()/2)
        local theta = -math.angle(love.graphics:getWidth()/2,love.graphics:getHeight()/2,mouseX,mouseY)
        print("RELEASE THOSE MONSTER JUICES")
        self.firing = true
    end
end

function LevelState:mousereleased(x, y, button)
    if button == "l" then self.firing = false end
end

function LevelState:focus(f)
    if not f then
        GameState.push(self.menu)
    end
end

return LevelState
