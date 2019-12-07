--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilColor = require("core.utils.color")
local UtilBackground = require("core.utils.background")

local EntityPlayer = require("core.entities.player")
local EntityCoin = require("core.entities.coins")

local game = {
  meta = {
    id = 1,
    name = "game",
    active = false,
    default = false
  },
  events = {
    setActiveScene = function() end
  }
}



--[[
  @description Initializes the game scene
  @param {Table} self: The table that invokes the function call
  @param {Table} events: The recieved events table
]]
function game.init(self, events)

  -- Invoking the event handlers
  self.setActiveScene = events.setActiveScene

  -- Creating a coin
  EntityCoin:init()

  -- Initializing the player
  EntityPlayer:init()
end



--[[
  @description The Game scene's updating life-cycle event listener
  @param {Table} self: The table that invokes the function call
  @param {Number} dt: Delta time
]]
function game.update(self, dt)

  -- Issuing an update for the coin entity
  EntityCoin:update(dt)

  -- Issuing an update for the player entity
  EntityPlayer:update(dt)
end


--[[
  @description The game scene's drawing life-cycle event listener
  @param {Table} self: The table that invokes the function call
]]
function game.draw(self)

  -- Tiling the background
  UtilBackground.tile(global.assets.gfx.bg.ground, 0, 0, "cover")
  
  -- Drawing the header
  -- UtilColor.rgba(61, 61, 61, 255, true)
  UtilColor.rgba(0, 0, 0, 80, true)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), global.ui.header.height)
  UtilColor.restore()

  -- Drawing the coin
  EntityCoin:draw()

  -- Drawing the player
  EntityPlayer:draw()
end

return game
