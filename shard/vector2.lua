local Vector2 = {}
Vector2._mt = {
  __index = Vector2
}

function Vector2:new(x, y)
  local instance = {x = x, y = y}
  setmetatable(instance, Vector2._mt)
  instance:set(x, y)
  return instance
end

function Vector2:set(x, y)
  self.x = x or 0
  self.y = y or 0
end

function Vector2:copy()
  return Vector2(self.x, self.y)
end

function Vector2:normalize()
  local length = self:length();
	if length ~= 0 then
		self.x = self.x / length;
		self.y = self.y / length;
		return self;
  end

	self.set(0, 0);
	return self;
end

function Vector2:length()
  return math.sqrt(self.x * self.x + self.y * self.y)
end

function Vector2:setLength(length)
  length = length or 1
  self:normalize()
  self:multiply(length)
  return self
end

function Vector2:distance(vector)
  return math.sqrt(((self.x - vector.x) * (self.x - vector.x)) + ((self.y - vector.y) * (self.y - vector.y)))
end

function Vector2:lerp(destVector, progress)
  self.x = self.x * (1 - progress) + destVector.x * progress
  self.y = self.y * (1 - progress) + destVector.y * progress
	return self;
end

function Vector2:rotateRad(radians)
  local cos = math.cos(radians);
	local sin = math.sin(radians);
	self.x = self.x * cos - self.y * sin;
	self.y = self.x * sin + self.y * cos;
  return self
end

function Vector2:add(vectorOrNumber)
  if type(vectorOrNumber) == "number" then
    self.x = self.x + vectorOrNumber
    self.y = self.y + vectorOrNumber
  else
    self.x = self.x + vectorOrNumber.x
    self.y = self.y + vectorOrNumber.y
  end
  return self
end

function Vector2:subtract(vectorOrNumber)
  if type(vectorOrNumber) == "number" then
    self.x = self.x - vectorOrNumber
    self.y = self.y - vectorOrNumber
  else
    self.x = self.x - vectorOrNumber.x
    self.y = self.y - vectorOrNumber.y
  end
  return self
end

function Vector2:multiply(vectorOrNumber)
  if type(vectorOrNumber) == "number" then
    self.x = self.x * vectorOrNumber
    self.y = self.y * vectorOrNumber
  else
    self.x = self.x * vectorOrNumber.x
    self.y = self.y * vectorOrNumber.y
  end
  return self
end

function Vector2:divide(vectorOrNumber)
  if type(vectorOrNumber) == "number" then
    self.x = self.x / vectorOrNumber
    self.y = self.y / vectorOrNumber
  else
    self.x = self.x / vectorOrNumber.x
    self.y = self.y / vectorOrNumber.y
  end
  return self
end

Vector2._mt.__tostring = function (t)
  return("[" .. t.x .. ", " .. t.y .. "]")
end

Vector2._mt.__unm = function (vec)
  return Vector2(-vec.x, -vec.y)
end

Vector2._mt.__eq = function (vec1, vec2)
  if vec1.x == vec2.x and vec1.y == vec2.y then return true end
  return false
end

Vector2._mt.__add = function (left, right)
  if type(left) == "table" and left:is(Vector2) and type(right) == "number" then
    return left:copy():add(right)
  elseif type(left) == "table" and left:is(Vector2) and type(right) == "table" and right:is(Vector2) then
    return left:copy():add(right)
  else
    print("shard.vector2.__add -- Left value is not vector2 or right value is not vector2 / number")
  end
  return nil
end

Vector2._mt.__sub = function (left, right)
  if type(left) == "table" and left:is(Vector2) and type(right) == "number" then
    return left:copy():subtract(right)
  elseif type(left) == "table" and left:is(Vector2) and type(right) == "table" and right:is(Vector2) then
    return left:copy():subtract(right)
  else
    print("shard.vector2.__sub -- Left value is not vector2 or right value is not vector2 / number")
  end
  return nil
end

Vector2._mt.__mul = function (left, right)
  if type(left) == "table" and left:is(Vector2) and type(right) == "number" then
    return left:copy():multiply(right)
  elseif type(left) == "table" and left:is(Vector2) and type(right) == "table" and right:is(Vector2) then
    return left:copy():multiply(right)
  else
    print("shard.vector2.__mul -- Left value is not vector2 or right value is not vector2 / number")
  end
  return nil
end

Vector2._mt.__div = function (left, right)
  if type(left) == "table" and left:is(Vector2) and type(right) == "number" then
    return left:copy():divide(right)
  elseif type(left) == "table" and left:is(Vector2) and type(right) == "table" and right:is(Vector2) then
    return left:copy():divide(right)
  else
    print("shard.vector2.__div -- Left value is not vector2 or right value is not vector2 / number")
  end
  return nil
end

return Vector2