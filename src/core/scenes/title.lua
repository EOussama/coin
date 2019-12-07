--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilText = require("core.utils.text")

local title = {
  name = "title"
}

function title.init()
end

function title.update(dt)
end

function title.draw()
  UtilText.print("Cöin", "center", 150, { r = 245, g = 158, b = 27, a = 255, preserve = true }, { fnt = global.assets.fonts.huge, preserve = true })
  UtilText.print("Press any key to start!", "center", 250, { r = 255, g = 255, b = 255, a = 255 }, { fnt = global.assets.fonts.large, preserve = true })
end

return title
