--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilAudio = require("core.utils.audio")
local UtilText = require("core.utils.text")
local UtilColor = require("core.utils.color")
local UtilBackground = require("core.utils.background")
local UtilCollision = require("core.utils.collision")

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

  -- Looping through all spawned coins
  for i = #EntityCoin.coins, 1, -1 do

    -- Checking  collision between the player and the spawned coins
    if UtilCollision.check(EntityPlayer:getCol(), EntityCoin:getCol(i)) == true then
      self:collectCoin(i)
    end
  end
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

  -- Printing the player's score
  UtilText.print("Score: " .. EntityPlayer.score, "left", "up", { r = 255, g = 255, b = 255, a = 255 }, { fnt = global.assets.fonts.large, preserve = true })
  
  -- Drawing the coin
  EntityCoin:draw()

  -- Drawing the player
  EntityPlayer:draw()

  -- Printing the pausing state
  if global.paused == true then
    UtilText.print("Game Paused", "right", "up", { r = 252, g = 186, b = 3, a = 255 }, { fnt = global.assets.fonts.large, preserve = true })
  end
end



--[[
  @description Collects a collated coin
  @param {Table} self: The table that invokes the function call
  @param {Number} index: The index of the coin to collect
]]
function game.collectCoin(self, index)

  -- Removing the collected coin
  EntityCoin:remove(index)

  -- Increasing the player' score
  EntityPlayer.score = EntityPlayer.score + 1

  -- Playing a complementory sound effect
  UtilAudio:play("effects", "coin")
end



return game
