local Locale = {}
Locale.mt = {
  __call = function(t, name) return Locale.translate(name) end
}
setmetatable(Locale, Locale.mt)

local locales = {}
local currentLocale
local fallbackLocale
local useLove2D = false

function Locale.useLove2D(value)
  useLove2D = value
end

function Locale.load(filename)
  if useLove2D then
    local locale = love.filesystem.load(filename)()
    locales[locale.id] = locale
  else
    local locale = dofile(filename)
    locales[locale.id] = locale
  end
end

function Locale.setFallbackLocale(id)
  if not Locale.containsLocale(id) then
    print("shard.locale.setFallbackLocale -- Locale with id '" .. id .. "' doesnt exist")
    return
  end
  fallbackLocale = id
end

function Locale.setLocale(id)
  if not Locale.containsLocale(id) then
    print("shard.locale.setLocale -- Locale with id '" .. id .. "' doesnt exist")
    return
  end
  currentLocale = id
end

function Locale.translate(string)
  if not currentLocale then
    if not fallbackLocale then
      print("shard.locale.translate -- Fallback locale isnt set")
      return nil
    end
  end

  local translatedString
  if Locale.containsLocale(currentLocale) then translatedString = locales[currentLocale].strings[string]
  else translatedString = locales[fallbackLocale].strings[string] end

  if not translatedString then
    print("shard.locale.translate -- Cannot translate string with name '" .. string .. "'")
  end
  return translatedString
end

function Locale.containsLocale(id)
  if locales[id] then return true
  else return false end
end

return Locale