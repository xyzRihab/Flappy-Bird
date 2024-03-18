Pipe = Class {}

local PIPE_IMAGE = love.graphics.newImage('pipe.png')

-- Speed of pipe scroll
PIPE_SPEED = 60

-- Height and width of pipe image
PIPE_HEIGHT = 288
PIPE_WIDTH = 70

-- Initialize Pipe object
function Pipe:init(orientation, y)
    self.x = VIRTUAL_WIDTH
    self.y = y
    self.width = PIPE_IMAGE:getWidth()
    self.height = PIPE_HEIGHT
    self.orientation = orientation
end

-- Update pipe
function Pipe:update(dt)
    
end

-- Render the pipe
function Pipe:render()
    love.graphics.draw(
        PIPE_IMAGE, -- Image
        self.x, -- X position
        (self.orientation == 'top' and self.y + PIPE_HEIGHT or self.y), -- Y position
        0, -- Rotation 
        1, -- X scale
        self.orientation == 'top' and -1 or 1 -- Y scale (mirroring for top pipe)
    )
end
