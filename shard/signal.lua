local Signal = {}
local signals = {}

function Signal.on(signalName, callback)
  if not signals[signalName] then signals[signalName] = {} end
  table.insert(signals[signalName], callback)
end

function Signal.emit(signalName, ...)
  if not signals[signalName] then return end
  
  for i=1, #signals[signalName] do
    signals[signalName][i](...)
  end
end

function Signal.unRegister(signalName, callback)
  if not signals[signalName] then return end

  for i=1, #signals[signalName] do
    if signals[signalName][i] == callback then table.remove(signals[signalName], i) end
  end
end

function Signal.clear(signalName)
  signals[signalName] = nil
end

return Signal