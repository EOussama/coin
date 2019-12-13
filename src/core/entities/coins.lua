--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilColor = require("core.utils.color")
local UtilTimer = require("core.utils.timer")

local coins = {
  coins = {}
}



--[[
  @description Initializes the coins module
  @param {Table} self: The table that invokes the function call
]]
function coins.init(self)

  -- Seeding the random function
  math.randomseed(love.timer.getTime())

  -- Initializing the coins' dimentions
  coins.width = global.assets.gfx.entities.coins['coin_1']:getWidth()
  coins.height = global.assets.gfx.entities.coins['coin_1']:getHeight()
  coins.scale = 0.6

  -- Starting a coins timer
  UtilTimer:start("timer" .. love.timer.getTime(), 1000, true, self.spawn)
end



--[[
  @description Spawns a random coin
]]
function coins.spawn()

  -- Checking if the game is not paused
  if global.paused == false then

    -- Calculating a random x position
    local x = math.random(love.graphics.getWidth(), 0)
  
    -- Calculating a random y position
    local y = math.random(0, love.graphics.getHeight())
  
    -- Creating a coin
    coins:create(x, y)
  end
end



--[[
  @description Creates a new coin
  @param {Table} self: The table that invokes the function call
]]
function coins.create(self, x, y)

  local width = love.graphics.getWidth()
  local height = love.graphics.getHeight()
  local coinWidth = global.assets.gfx.entities.coins['coin_1']:getWidth()
  local coinHeight = global.assets.gfx.entities.coins['coin_1']:getHeight()

  -- Sanitizing the input values
  if x == nil then x = coinWidth end
  if x > width - coinWidth then x = width - coinWidth end
  if y == nil then y = coinHeight end
  if y < global.ui.header.height then y = global.ui.header.height + coinHeight end
  if y > height - coinHeight then y = height - coinHeight end

  -- Inserting the created coin into the coins collection
  table.insert(self.coins, { x = x, y = y })
end



--[[
  @description Removes a coin
  @param {Table} self: The table that invokes the function call
  @param {Number} index: The index of the coin to remove
]]
function coins.remove(self, index)
  table.remove(self.coins, index)
end



--[[
  @description The coins' updating life-cycle event handler
  @param {Table} self: The table that invokes the function call
  @param {Number} dt: Delta time
]]
function coins.update(self, dt) end



--[[
  @description The coins' drawing life-cycle event handler
  @param {Table} self: The table that invokes the function call
]]
function coins.draw(self)

  -- Checking if the game is paused
  if global.paused == true then

    -- Changing the overlay color when the game is paused
    love.graphics.setColor(0.4, 0.4, 0.4)
  end

  for i = 1, #self.coins, 1 do
    love.graphics.draw(global.assets.gfx.entities.coins['coin_1'], self.coins[i].x, self.coins[i].y, 0, self.scale, self.scale)
  end
end



--[[
  @description Gets the collision object for the coin entity
  @param {Table} self: The table that invokes the function call
]]
function coins.getCol(self, index)
  return {
    x = self.coins[index].x,
    y = self.coins[index].y,
    width = self.width * self.scale,
    height = self.height * self.scale
  }
end



return coins