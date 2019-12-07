--[[

  @Author:        Eoussama
  @Version:       v0.0.1
  @Creation date:    6/12/2019 - 11:24PM

]]

local core = require("core.core")

function love.load()
  core:init()
end

function love.update(dt)
  core:update(dt)
end

function love.draw()
  core:draw()
end
