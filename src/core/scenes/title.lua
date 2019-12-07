--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilText = require("core.utils.text")

local title = {
  id = 0,
  name = "title",
  active = false,
  default = false,
  events = {
    setActiveScene = function() end
  }
}

function title.init(events)
  title.setActiveScene = events.setActiveScene
end

function title.update(dt)
end

function love.keypressed(key)
  if key == 'space' and title.active == true then
    title.setActiveScene(1)
  end
end

function title.draw()
  UtilText.print("Cöin", "center", 150, { r = 245, g = 158, b = 27, a = 255, preserve = true }, { fnt = global.assets.fonts.huge, preserve = true })
  UtilText.print("Press SPACE to start!", "center", 250, { r = 255, g = 255, b = 255, a = 255 }, { fnt = global.assets.fonts.large, preserve = true })
end

return title
