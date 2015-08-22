local LevelState    = class({})

function LevelState:init()
    self.level = 0
    self.lastKeyTimer = 0
    self.playerX = love.graphics:getWidth()/2
    self.playerY = love.graphics:getHeight()/2
end

function LevelState:enter(previous, menuState, monsterColour)
    print("Enter LevelState")
    self.menu = menuState
    if monsterColour == "blue" then

    elseif monsterColour == "red" then

    else
        self.monsterGraphic = love.graphics.newImage('assets/greenMonster.png')
    end
end

function LevelState:update(dt)
    self.lastKeyTimer = self.lastKeyTimer + 1
    local mouseX, mouseY = love.mouse.getPosition()
    -- if mouseX - self.monsterGraphic:getWidth()/2 <= 0 then
    --     self.playerX = self.monsterGraphic:getWidth()/2
    -- elseif love.graphics:getWidth() <= mouseX + self.monsterGraphic:getWidth()/2 then
    --     self.playerX = love.graphics:getWidth() - self.monsterGraphic:getWidth()/2
    -- else
    --     self.playerX = mouseX
    -- end
    -- if mouseY - self.monsterGraphic:getHeight()/2 <= 0 then
    --     self.playerY = self.monsterGraphic:getHeight()/2
    -- elseif love.graphics:getHeight() <= mouseY + self.monsterGraphic:getHeight()/2 then
    --     self.playerY = love.graphics:getHeight() - self.monsterGraphic:getHeight()/2
    -- else
    --     self.playerY = mouseY
    -- end
    if love.keyboard.isDown('w') or love.keyboard.isDown('up')      then self:movePlayer('up') end
    if love.keyboard.isDown('a') or love.keyboard.isDown('left')    then self:movePlayer('left') end
    if love.keyboard.isDown('s') or love.keyboard.isDown('down')    then self:movePlayer('down') end
    if love.keyboard.isDown('d') or love.keyboard.isDown('right')   then self:movePlayer('right') end
end

function LevelState:draw()
    love.graphics.setColor(255,255,255)
    love.graphics.print('LEVEL STATE',0,0)
    love.graphics.draw(self.monsterGraphic,self.playerX-self.monsterGraphic:getWidth()/2,self.playerY-self.monsterGraphic:getHeight()/2)
end

function LevelState:enterMenu()
    GameState.push(self.menu)
end

function LevelState:keypressed(key)
    if key == 'w' or key == 'up' or key == 'a' or key == 'left' or key == 's' or key == 'down' or key == 'd' or key == 'right' then
        if self.lastKeyTimer <= 10 then
            -- Set charge rate to +
        elseif 100 <= self.lastKeyTimer then
            -- Set charge rate to -
        else
            -- Set charge rate to 0
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
end

function LevelState:mousepressed(x, y, button)
    if button == "l" then
        mouseX = x
        mouseY = y
        print(mouseX..' '..mouseY)
        print("RELEASE THOSE MONSTER JUICES")
    end
end

function LevelState:focus(f)
    if not f then
        GameState.push(self.menu)
    end
end

return LevelState
