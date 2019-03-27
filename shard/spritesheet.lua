local Base = require("shard/base")

local Spritesheet = Base:extend("Spritesheet")

function Spritesheet:init(filename)
  local instance = {}
  setmetatable(instance, Spritesheet.mt)

  local config = love.filesystem.load(filename)()
  instance.image = love.graphics.newImage(config.image)
  instance.quads = {}

  for i, v in pairs(config.sprites) do
    instance.quads[i] = love.graphics.newQuad(v.x or 0, v.y or 0, v.w or 0, v.h or 0, instance.image:getDimensions())
  end

  return instance
end

function Spritesheet:draw(name, x, y, r, sx, sy)
  love.graphics.draw(self.image, self.quads[name] or nil, x or 0, y or 0, r or 0, sx or 1, sy or 1)
end

return Spritesheet