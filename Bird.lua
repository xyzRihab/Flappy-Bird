Bird = Class {}

local GRAVITY = 20

-- Initialize Bird object
function Bird:init()
    self.image = love.graphics.newImage('bird.png')
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()

    -- Position bird in the middle of the screen
    self.x = VIRTUAL_WIDTH / 2 - (self.width / 2)
    self.y = VIRTUAL_HEIGHT / 2 - (self.height / 2)

    self.dy = 0
end

-- Update bird's position
function Bird:update(dt)
    -- Apply gravity to velocity
    self.dy = self.dy + GRAVITY * dt

    -- Add a sudden burst of negative gravity if space key is pressed
    if love.keyboard.wasPressed('space') then
        self.dy = -5
    end

    -- Apply current velocity to Y position
    self.y = self.y + self.dy
end

-- Render bird on the screen
function Bird:render()
    love.graphics.draw(self.image, self.x, self.y)
end
