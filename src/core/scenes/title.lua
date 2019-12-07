--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilFont = require("core.utils.font")

local title = {
  name = "title"
}

function title.init()
end

function title.update(dt)
end

function title.draw()
  UtilFont.set(settings.assets.fonts.huge, true)
  love.graphics.print("Title screen", 0, 0)
  UtilFont.restore()
end

return title
