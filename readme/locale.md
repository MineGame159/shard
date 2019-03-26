# shard.locale
Locale / translation system for Lua or Love2D

```lua
local Locale = require("shard.locale")
```

## Locale.useLove2D(value)
If you are using Love2D then default is true otherwise false

## Locale.load(filename)
Loads new locale .lua config file

### Config file structure
```lua
return {
  id = "en",
  strings = {
    sample_text = "Welcome"
  }
}
```

## Locale.setFallbackLocale(id)
Sets locale to use when string cannot be translated in current locale

## Locale.setLocale(id)
Sets locale to use

## Locale.translate(string) / Locale(string)
Translates string to currently set locale or if cannot be translated then to fallback locale

## Locale.constainsLocale(id)
Checks if locale is loaded

## Example
```lua
local Locale = require("shard.locale")

Locale.load("en.lua")
Locale.setLocale("en")

print(Locale("test"))
```