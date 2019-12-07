--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilColor = require("core.utils.color")

local EntityPlayer = require("core.entities.player")
local EntityCoin = require("core.entities.coins")

local game = {
  name = "game"
}

function game.init()
  EntityCoin:create()
  EntityPlayer:init()
end

function game.update(dt)
  EntityCoin:update(dt)
  EntityPlayer:update(dt)
end

function game.draw()

  UtilColor.rgba(61, 61, 61, 255, true)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), settings.ui.header.height)
  UtilColor.restore()

  EntityCoin:draw()
  EntityPlayer:draw()
end

return game
