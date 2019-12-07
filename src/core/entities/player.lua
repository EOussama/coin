--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilColor = require("core.utils.color")

local player = {
  x = 0,
  y = 100,
  score = 0,
  velocity = 2,
  direction = 0,
}

function player.init(self)
  player.x = love.graphics.getWidth() / 2 - 25
  player.y = love.graphics.getHeight() / 2 - 25
end

function player.update(self, dt)
  if love.keyboard.isDown("up") and self.y > global.ui.header.height then
    self.y = self.y - self.velocity
    if self.y < global.ui.header.height then self.y = global.ui.header.height end
  end
  
  if love.keyboard.isDown("right") and self.x < love.graphics.getWidth() - global.ui.header.height then
    self.x = self.x + self.velocity
    if self.x > love.graphics.getWidth() - global.ui.header.height then self.x = love.graphics.getWidth() - global.ui.header.height end
  end

  if love.keyboard.isDown("down") and self.y < love.graphics.getHeight() - global.ui.header.height then
    self.y = self.y + self.velocity
    if self.y > love.graphics.getHeight() - global.ui.header.height then self.y = love.graphics.getHeight() - global.ui.header.height end
  end

  if love.keyboard.isDown("left") and self.x > 0 then
    self.x = self.x - self.velocity
    if self.x < 0 then self.x = 0 end
  end
end

function player.draw(self)
  UtilColor.rgba(62, 140, 67, 255, true)
  love.graphics.rectangle("fill", self.x, self.y, 50, 50)
  UtilColor.restore()
end

return player
