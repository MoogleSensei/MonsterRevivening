local Sleeper	  = class({
    init = function(self, maxX, maxY)
        self.x,self.y = math.random(maxX),math.random(maxY)
        self.mapWidth = maxX
        self.mapHeight = maxY
        self.image = love.graphics.newImage('assets/sleeper.png')
    end,
    draw = function(self)
        if self.isAlive then
            love.graphics.draw(self.image,self.x,self.y,self.theta,1,1,self.width/2,self.height/2)
        end
    end,
    update = function(self,dt)
        if self.isAlive then
            if not(self.energy == 'asleep') then
                if self.moveTimer <= self.timeToStopMove then
                    if self.energy == 'crazed' then
                        self.moveAmount = 20
                    else
                        self.moveAmount = 5
                    end
                else
                    self.moveAmount = 0
                end
                if self.timeToMove <= self.moveTimer then
                    self.moveAngle = math.random(-math.pi,math.pi)
                    self.moveTimer = 0
                end
                self:moveSleeper(self.moveAmount,self.moveAngle)
            end
            if self.isBeingSprayed then
                if self.x <= 0 or self.mapWidth <= self.x or self.y <= 0 or self.mapHeight <= self.y then
                    self.isAlive = false
                end
            else
                if self.x <= 0 then
                    if self.energy == 'crazed' then
                        self.isAlive = false
                    else
                        self.x = 0
                    end
                elseif self.mapWidth <= self.x then
                    if self.energy == 'crazed' then
                        self.isAlive = false
                    else
                        self.x = self.mapWidth
                    end
                end
                if self.y <= 0 then
                    if self.energy == 'crazed' then
                        self.isAlive = false
                    else
                        self.y = 0
                    end
                elseif self.mapHeight <= self.y then
                    if self.energy == 'crazed' then
                        self.isAlive = false
                    else
                        self.y = self.mapHeight
                    end
                end
            end
            self.moveTimer = self.moveTimer + 1
            self.isBeingSprayed = false
        end
    end,
    moveSleeper = function(self, amount, angle)
        local offsetX = amount*math.cos(angle)
        local offsetY = amount*math.sin(angle)
        self.x = self.x + offsetX
        self.y = self.y + offsetY
    end,
    getSprayed = function(self, sprayLevel, sprayAngle)
        self.caffeine = self.caffeine + 5*sprayLevel
        if self.caffeine <= 20 then
            self.energy = 'asleep'
        elseif 200 <= self.caffeine then
            self.energy = 'crazed'
            self.timeToMove = 50
        else
            self.energy = 'awake'
        end
        self:moveSleeper(10*sprayLevel,sprayAngle)
        self.isBeingSprayed = true
    end,
    x = 0,
    y = 0,
    width = 64,
    height = 64,
    mapWidth = 1024,
    mapHeight = 768,
    caffeine = 0,
    energy = 'asleep',
    moveAmount = 0,
    moveAngle = 0,
    moveTimer = 0,
    timeToMove = 100,
    timeToStopMove = 20,
    isBeingSprayed = false,
    isAlive = true
    })

return Sleeper
