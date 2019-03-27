local Timer = require("shard/timer")

function timerCallback()
  print("tick")
end

local timer

function love.load()
  timer = Timer(2.25, timerCallback)
end

function love.update(dt)
  timer:update(dt)
end