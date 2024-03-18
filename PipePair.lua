PipePair = Class{}

-- Size of the gap between pipes
local GAP_HEIGHT = 100

-- Initialize PipePair object
function PipePair:init(y)
    self.x = VIRTUAL_WIDTH + 32
    self.y = y

    -- Instantiate two pipes into a pair
    self.pipes = {
        ['upper'] = Pipe('top', self.y),
        ['lower'] = Pipe('bottom', self.y + PIPE_HEIGHT + GAP_HEIGHT)
    }

    -- Whether a pipe pair is ready to be removed from the screen
    self.remove = false
end

-- Update pipe pair position
function PipePair:update(dt)
    -- Remove the pipe from the scene if it's beyond the left edge of the screen,
    -- else move it from right to left
    if self.x > -PIPE_WIDTH then
        self.x = self.x - PIPE_SPEED * dt
        self.pipes['lower'].x = self.x
        self.pipes['upper'].x = self.x
    else
        self.remove = true
    end
end

-- Render the pipe pair
function PipePair:render()
    for k, pipe in pairs(self.pipes) do
        pipe:render()
    end
end
