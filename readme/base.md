# shard.base
Fast class system with support for inheritance.
Cannot call super constructor. Constructor is inherited but can be modified

```lua
local Base = require("shard/base")
```

## Base:extend(className)
Extends class with specified class name

## Base:new(...) / Base(...)
Creates class with parameters and calls Base:init

## Base:is(class)
Checks if class extends specified class

## Example
```lua
local Base = require("shard/base")

local Entity = Base:extend("Entity")
function Entity:init()
  print("entity created")
end
function Entity:takeDamage(damage)
  print("entity took damage " .. damage)
end

local Player = Entity:extend("Player")
function Player:walk()
  print("player walked")
end

local player = Player()
player:takeDamage(5.2)
player:walk()
print(player:is(Entity))
```

## Reserved keys in class
 - **extend** - extends class
 - **new** - instantiates class
 - **is** - checks if class extends specified class
 - **init** - constructor, called when instantiating class
 - **_className** - Class name, **DONT MODIFY**
 - **_extends** - List of class names that this class extends (class cannot extend multiple classes), **DONT MODIFY**