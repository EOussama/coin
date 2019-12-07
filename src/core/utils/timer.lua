--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local timers = {}

function timers.start(self, name, time, loop, callback)
  if name == nil then name = "" end
  if loop == nil then loop = false end
  if callback == nil then callback = function() end end

  if self:get(name) then
    self:restart(name)
  else
    local timer = {
      id = #self + 1,
      name = name,
      tick = 0,
      loop = loop,
      time = time,
      started = true,
      finished = false,
      callback = callback
    }
  
    table.insert(self, timer)
  end
end

function timers.restart(self, name)
  local timer = self:get(name)

  timer.tick = 0
  timer.started = true
  timer.finished = false
end

function timers.finish(self, name)
  for i = 1, #self, 1 do
    local timer = self[i]

    if timer.name == name then
      timer.started = true
      timer.finished = true
      timer.callback()
    end
  end
end

function timers.update(self, dt)
  for i = 1, #self, 1 do
    local timer = self[i]

    if timer.started == true and timer.finished == false then
      timer.tick = timer.tick + dt * 1000
  
      if timer.tick >= timer.time then
        self:finish(timer.name)
  
        if timer.loop == true then
          self:start(timer.name, timer.time, timer.loop, timer.callback)
        end
      end
    end
  end
end

function timers.get(self, name)
  for i = 1, #self, 1 do
    local timer = self[i]

    if timer.name == name then
      return timer
    end
  end

  return nil
end

return timers
