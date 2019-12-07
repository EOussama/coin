--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilFont = require("core.utils.font")
local UtilColor = require("core.utils.color")

local text = {}

function text.print(txt, x, y, color, font)
  if font ~= nil then UtilFont.set(font.fnt, font.preserve) end
  if color ~= nil then UtilColor.rgba(color.r, color.g, color.b, color.a, color.preserve) end

  if type(x) == "string" then
    if x == "center" then
      x = love.graphics.getWidth() / 2 - font.fnt:getWidth(txt) / 2
    end
  end

  if type(y) == "string" then
    if y == "center" then
      y = love.graphics.getHeight() / 2 - font.fnt:getHeight(txt) / 2
    end
  end

  love.graphics.print(txt, x, y)

  if font ~= nil and font.preserve == true then UtilFont.restore() end
  if color ~= nil and color.preserve == true then UtilColor.restore() end
end

return text
