--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilColor = require("core.utils.color")

local EntityPlayer = require("core.entities.player")
local EntityCoin = require("core.entities.coins")

local game = {
  meta = {
    id = 1,
    name = "game",
    active = false,
    default = false
  },
  events = {
    setActiveScene = function() end
  }
}

function game.init(self, events)
  EntityCoin:create()
  EntityPlayer:init()

  self.setActiveScene = events.setActiveScene
end

function game.update(self, dt)
  EntityCoin:update(dt)
  EntityPlayer:update(dt)
end

function game.draw(self)
  UtilColor.rgba(61, 61, 61, 255, true)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), global.ui.header.height)
  UtilColor.restore()

  EntityCoin:draw()
  EntityPlayer:draw()
end

return game
