local Locale = require("shard/locale")

Locale.load("en.lua")
Locale.load("sk.lua")

--Locale.setFallbackLocale("en")
Locale.setLocale("en")

print(Locale("test"))