--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

require "core.utils.global"
local Core = require("core.core")



--[[
  @description Love2D loading life-cycle event
]]
function love.load()

  -- Initializing the game
  Core:init()
end



--[[
  @description Love2D updating life-cycle event
  @param {Number} dt: Delta time
]]
function love.update(dt)

  -- Issuing a game-wide update
  Core:update(dt)
end



--[[
  @description Love2D drawing life-cycle event
]]
function love.draw()

  -- Drawing the game
  Core:draw()
end
