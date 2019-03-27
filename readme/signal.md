# shard.signal
Simple but powerful signal system

```lua
local Signal = require("shard/signal")
```

## Signal.on(signalName, callback)
Adds callback function to signal

## Signal.emit(signalName, ...)
Emits signal with or without parameters

## Signal.unRegister(signalName, callback)
Removes callback function from signal

## Signal.clear(signalName)
Clears all callback functions from signal

## Example
```lua
local Signal = require("shard/signal")

function test1(a)
  print(a .. 1)
end

function test2(a)
  print(a .. 2)
end

Signal.on("test", test1)
Signal.on("test", test2)
Signal.on("test", function()
  print("anonymous function")
end)

Signal.emit("test", "its only test ")

print()

Signal.unRegister("test", test2)
Signal.emit("test", "its only test ")

print()

Signal.clear("test")
Signal.emit("test", "its only test ")
```