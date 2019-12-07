--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

require "core.utils.global"
local Core = require("core.core")

function love.load()
  Core:init()
end

function love.update(dt)
  Core:update(dt)
end

function love.draw()
  Core:draw()
end
