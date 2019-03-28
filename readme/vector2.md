# shard.vector2
Vector2 class  
*Requires shard.base*

## Features
 - Lots of helper methods
 - Chaining methods
 - Defined methods for +, -, *, /, ==, ~= operators
 - Defined tostring method

```lua
local Vector2 = require("shard/vector2")
```

## Vector2(x, y)
Creates new vector

## Vector2:set(x, y)
Sets vector

## Vector2:copy()
Copies vector

## Vector2:add(vectorOrNumber)
Adds vector / number to current vector

## Vector2:subtract(vectorOrNumber)
Subrects vector / number to current vector

## Vector2:multiply(vectorOrNumber)
Multiplies vector / number to current vector

## Vector2:divide(vectorOrNumber)
Divides vector / number to current vector

## Vector2:normalize()
Normalizes vector

## Vector2:length()
Returns vector length

## Vector2:setLength(length)
Sets vector length

## Vector2:distance(vector)
Returns distance to another vector

## Vector2:lerp(destVector, progress)
Lerps current vector to destVector by progress (0 - 1)

## Vector2:rotateRad(radians)
Rotates vector using radians

## Example
```lua
local Vector2 = require("shard/vector2")

local direction = Vector2(1, 0)
direction:rotateRad(1):add(5)
direction = direction - Vector2(0.365, 5):length()
direction:setLength(2.25)
print(direction)
```