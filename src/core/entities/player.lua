--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilColor = require("core.utils.color")

local player = {
  x = 0,
  y = 0,
  score = 0,
  velocity = 0,
  direction = 0,
}

function player.init()
  player = {
    x = 0,
    y = 100,
    score = 0,
    velocity = 4,
    direction = 0
  }
end

function player.update(self, dt)
  if love.keyboard.isDown("up") and player.y > global.ui.header.height then
    player.y = player.y - player.velocity
  end

  if love.keyboard.isDown("right") and player.x < love.graphics.getWidth() - 50 then
    player.x = player.x + player.velocity
  end

  if love.keyboard.isDown("down") and player.y < love.graphics.getHeight() - 50 then
    player.y = player.y + player.velocity
  end

  if love.keyboard.isDown("left") and player.x > 0 then
    player.x = player.x - player.velocity
  end
end

function player.draw()
  UtilColor.rgba(62, 140, 67, 255, true)
  love.graphics.rectangle("fill", player.x, player.y, 50, 50)
  UtilColor.restore()
end

return player
