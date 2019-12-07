--[[

  @Author:        Eoussama
  @Version:       v0.0.1
  @Creation date:    6/12/2019 - 11:24PM

]]

local player = require("core.player")

function love.load()
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
  love.graphics.print("Score: " .. player.score)
  player:draw()
end
