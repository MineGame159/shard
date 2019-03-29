# shard.timer
Extremely simple timer

```lua
local Timer = require("shard.timer")
```

## Timer:new(duration, callback) / Timer(duration, callback)
Creates new timer with duration and callback function

## Timer:update(deltaTime)
Updates timer based on delta time

## Example
```lua
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
```