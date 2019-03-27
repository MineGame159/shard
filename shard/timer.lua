local Base = require("shard/base")

local Timer = Base:extend("Timer")

function Timer:init(duration, callback)
  self.duration = duration or 1
  self.currentTime = 0
  self.callback = callback
end

function Timer:update(deltaTime)
  self.currentTime = self.currentTime + deltaTime or 0
  
  if self.currentTime > self.duration then
    self.currentTime = self.currentTime - self.duration
    self.callback()
  end
end

return Timer