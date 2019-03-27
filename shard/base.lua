local Base = {_className = "Base", _extends = {}}

function Base:extend(className)
  local class = copyTable(self)
  class._className = className
  class._extends = copyTable(self._extends)
  table.insert(class._extends, self._className)
  class._mt = {
    __index = Base,
    __call = function(t, ...) return class:new(...) end
  }
  setmetatable(class, class._mt)
  return class
end

function Base:new(...)
  local instance = copyTable(self)
  instance._mt.__call = nil
  setmetatable(instance, instance._mt)
  if instance.init then instance:init(...) end
  return instance
end

function Base:is(class)
  if self._className == class._className then return true end
  for i, v in pairs(self._extends) do
    if v == class._className then return true end
  end
  return false
end

function copyTable(source)
  local new = {}
  for i, v in pairs(source) do
    if type(v) == "table" then new[i] = copyTable(v)
    else new[i] = v end
  end
  return new
end

return Base