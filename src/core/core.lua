--[[

  @Author:        Eoussama
  @Version:       v0.0.1
  @Creation date:    6/12/2019 - 11:24PM

]]

local player = require("core.player")
local coins = require("core.coins")

local core = {}

function core.init ()
  coins:create()
end

function core.update(dt)
  player:update(dt)
end

function core.draw()
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), settings.ui.header.height)

  love.graphics.print("Score: " .. player.score)

  player:draw()
  coins:draw()
end

return core
