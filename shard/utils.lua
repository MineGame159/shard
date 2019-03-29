local Utils = {}

function Utils.clamp(number, min, max)
  if number < min then return min
  elseif number > max then return max
  else return number end
end

function Utils.lerp(from, to, progress)
  return from * (1 - progress) + to * progress
end

return Utils