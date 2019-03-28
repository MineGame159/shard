# knife.spritesheet
Loads and draws specific portions of image  
*Requires [shard.base](base)*

```lua
local Spritesheet = require("shard/spritesheet")
```

## Spritesheet:new(filename) / Spritesheet(filename)
Creates new spritesheet from .lua config file

### Config file structure
```lua
return {
  image = "path_to_image.png",
  sprites = {
    "sprite_name" = {
      x = 0,
      y = 16,
      w = 16,
      h = 16
    }
  }
}
```

## Spritesheet:draw(name, x, y, r, sx, sy)
Draws specific sprite

### Parameters
 * *string* **name** - Sprite name
 * *number* **x, y** - Position
 * *number* **r** - Rotation in radians
 * *number* **sx, sy** - Scale

## Example
```lua
local Spritesheet = require("shard/spritesheet")
local spritesheet

function love.load()
  spritesheet = Spritesheet:new("sprites.lua")
end

function love.draw()
  spritesheet:draw("character", 16, 64)
end
```