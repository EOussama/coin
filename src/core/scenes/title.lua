--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilText = require("core.utils.text")
local UtilAudio = require("core.utils.audio")
local UtilTimer = require("core.utils.timer")

local title = {
  meta = {
    id = 0,
    name = "title",
    active = false,
    default = false
  },
  events = {
    setActiveScene = function() end,
    flickerTimerEnded = function() end
  },
  store = {
    flicker = true,
    time
  }
}

function title.init(self, events)
  self.setActiveScene = events.setActiveScene
  UtilAudio.play("ambient", "music", 0.2, true)
  UtilTimer:start(200, true, flickerTimerEnded)
end

function title.update(self, dt)
  UtilTimer:update(dt)
end

function love.keypressed(key)
  if key == 'space' and title.meta.active == true then
    title.setActiveScene(1)
  end
end

function title.draw(self)
  UtilText.print("Cöin", "center", 150, { r = 245, g = 158, b = 27, a = 255, preserve = true }, { fnt = global.assets.fonts.huge, preserve = true })

  if self.store.flicker == true then
    UtilText.print("Press SPACE to start!", "center", 250, { r = 255, g = 255, b = 255, a = 255 }, { fnt = global.assets.fonts.large, preserve = true })
  end
end

function flickerTimerEnded()
  title.store.flicker = not title.store.flicker
end

return title
