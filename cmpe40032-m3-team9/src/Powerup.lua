Powerup = Class{}

function Powerup:init()
    self.width = 16
    self.height = 16

    self.x = math.random(1, VIRTUAL_WIDTH - self.width)
    self.y = VIRTUAL_HEIGHT / 2 - 20
    self.dy = 10
end

function Powerup:collides(target)
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    
    return true
end
function Powerup:setSkin()
    if self.type == 'ball' then
        self.skin = 1
    else
        self.skin = 2
    end
end

function Powerup:update(dt)
    self.y = self.y + self.dy * dt
end

function Powerup:render()
    love.graphics.draw(gTextures['main'], gFrames['powerup'][self.skin], self.x, self.y)
end 