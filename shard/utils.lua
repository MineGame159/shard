local Utils = {}

function degToRad(deg)
  return deg * 0.0174532925
end

function radToDeg(rad)
  return rad * 57.295779513
end

function clamp(number, min, max)
  if number < min then return min
  elseif number > max then return max
  else return number end
end

function lerp(from, to, progress)
  return from * (1 - progress) + to * progress
end

return Utils