--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local timer = {
  tick = 0,
  time = 0,
  loop = false,
  started = false,
  finished = false,
  callback = function() end
}

function timer.start(self, time, loop, callback)
  if loop == nil then loop = false end
  if callback == nil then callback = function() end end

  self.tick = 0
  self.loop = loop
  self.time = time
  self.started = true
  self.finished = false
  self.callback = callback
end

function timer.finish(self)
  self.started = true
  self.finished = true
  self.callback()
end

function timer.update(self, dt)
  if self.started == true and self.finished == false then
    self.tick = self.tick + dt * 1000

    if self.tick >= self.time then
      self:finish()

      if self.loop == true then
        self:start(self.time, self.loop, self.callback)
      end
    end
  end
end

return timer
