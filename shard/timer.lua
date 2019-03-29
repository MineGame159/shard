local Timer = {}
Timer._mt = {
  __index = Timer
}

function Timer:new(duration, callback)
  local instance = {}
  setmetatable(instance, Timer._mt)
  instance.duration = duration or 1
  instance.currentTime = 0
  instance.callback = callback
  return instance
end

function Timer:update(deltaTime)
  self.currentTime = self.currentTime + deltaTime or 0
  
  if self.currentTime > self.duration then
    self.currentTime = self.currentTime - self.duration
    self.callback()
  end
end

return Timer