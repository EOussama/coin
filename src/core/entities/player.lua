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



--[[
  @description Initializes the player
  @param {Table} self: The table that invokes the function call
]]
function player.init(self)
  self.x = love.graphics.getWidth() / 2 - 25
  self.y = love.graphics.getHeight() / 2 - 25
end



--[[
  @description The player's updating life-cycle event handler
  @param {Table} self: The table that invokes the function call
]]
function player.update(self, dt)

  -- Checking if the 'up' key is pressed
  if love.keyboard.isDown("up") and self.y > global.ui.header.height then
    self.y = self.y - self.velocity
    if self.y < global.ui.header.height then self.y = global.ui.header.height end
  end
  
  -- Checking if the 'right' key is pressed
  if love.keyboard.isDown("right") and self.x < love.graphics.getWidth() - global.ui.header.height then
    self.x = self.x + self.velocity
    if self.x > love.graphics.getWidth() - global.ui.header.height then self.x = love.graphics.getWidth() - global.ui.header.height end
  end

  -- Checking if the 'down' key is pressed
  if love.keyboard.isDown("down") and self.y < love.graphics.getHeight() - global.ui.header.height then
    self.y = self.y + self.velocity
    if self.y > love.graphics.getHeight() - global.ui.header.height then self.y = love.graphics.getHeight() - global.ui.header.height end
  end

  -- Checking if the 'left' key is pressed
  if love.keyboard.isDown("left") and self.x > 0 then
    self.x = self.x - self.velocity
    if self.x < 0 then self.x = 0 end
  end
end



--[[
  @description The player's drawing life-cycle event handler
  @param {Table} self: The table that invokes the function call
]]
function player.draw(self)

  -- Drawing the player
  UtilColor.rgba(62, 140, 67, 255, true)
  love.graphics.rectangle("fill", self.x, self.y, 50, 50)
  UtilColor.restore()
end

return player
