--[[

  @Author:        Eoussama
  @Version:       v0.0.1
  @Creation date:    6/12/2019 - 11:24PM

]]

local EntityPlayer = require("core.entities.player")
local EntityCoin = require("core.entities.coins")

local game = {
  name = "game"
}

function game.update(dt)
  EntityPlayer:update(dt)
end

function game.draw()
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), settings.ui.header.height)

  EntityPlayer:draw()
  EntityCoin:draw()
end

return game
