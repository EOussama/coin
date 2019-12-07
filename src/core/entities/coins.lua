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

  -- Starting a coins timer
  UtilTimer:start("timer" .. love.timer.getTime(), 1000, true, self.spawn)
end



--[[
  @description Spawns a random coin
]]
function coins.spawn()

  -- Calculating a random x position
  local x = math.random(love.graphics.getWidth(), 0)

  -- Calculating a random y position
  local y = math.random(0, love.graphics.getHeight())

  -- Creating a coin
  coins:create(x, y)
end


--[[
  @description Creates a new coin
  @param {Table} self: The table that invokes the function call
]]
function coins.create(self, x, y)

  -- Sanitizing the input values
  if x == nil or x < 10 then x = 10 end
  if x > love.graphics.getWidth() - 10 then x = love.graphics.getWidth() - 10 end
  if y == nil then y = 10 end
  if y < global.ui.header.height then y = global.ui.header.height + 10 end
  if y > love.graphics.getHeight() - 10 then y = love.graphics.getHeight() - 10 end

  -- Inserting the created coin into the coins collection
  table.insert(self.coins, { x = x, y = y })
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
  UtilColor.rgba(255, 213, 0, 255, true)
  for i = 1, #self.coins, 1 do
    love.graphics.circle("fill", self.coins[i].x, self.coins[i].y, 10)
  end
  UtilColor.restore()
end

return coins