--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilColor = require("core.utils.color")

local coins = {}

function coins.create()
  local c = {
    x = 500,
    y = 250
  }

  table.insert(coins, c)
end

function coins.update(dt)
end

function coins.draw()
  UtilColor.rgba(255, 213, 0, 255, true)
  for i = 1, #coins, 1 do
    love.graphics.circle("fill", 152, 320, 10)
  end
  UtilColor.restore()
end

return coins