--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilColor = require("core.utils.color")
local UtilAnimation = require("core.utils.animation")

local player = {
  x = 0,
  y = 100,
  score = 0,
  velocity = 2,
  direction = "down",
  width = 50,
  height = 50,
  sprite = nil
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
    self.direction = "up"
    
    if self.y < global.ui.header.height then self.y = global.ui.header.height end
  end
  
  -- Checking if the 'right' key is pressed
  if love.keyboard.isDown("right") and self.x < love.graphics.getWidth() - self.width then
    self.x = self.x + self.velocity
    self.direction = "right"
    
    if self.x > love.graphics.getWidth() then self.x = love.graphics.getWidth() end
  end

  -- Checking if the 'down' key is pressed
  if love.keyboard.isDown("down") and self.y < love.graphics.getHeight() - self.height then
    self.y = self.y + self.velocity
    self.direction = "down"
    
    if self.y > love.graphics.getHeight() then self.y = love.graphics.getHeight() end
  end

  -- Checking if the 'left' key is pressed
  if love.keyboard.isDown("left") and self.x > 0 then
    self.x = self.x - self.velocity
    self.direction = "left"

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
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  UtilColor.restore()
end



--[[
  @description Gets the collision object for the player entity
  @param {Table} self: The table that invokes the function call
]]
function player.getCol(self)
  return {
    x = self.x,
    y = self.y,
    width = self.width,
    height = self.height
  }
end



return player
