--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilTimer = require("core.utils.timer")
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
  },
  store = {
    flicker = true,
    time = 5
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

  -- Reseting the time
  self.store.time = 5

  -- Creating a coin
  EntityCoin:init()

  -- Initializing the player
  EntityPlayer:init()

  -- Starting a timer for flickering
  UtilTimer:start("game_flicker", 400, true, flickerTimerEnded)

  -- Starting a timer for progress
  UtilTimer:start("game_time", 1000, true, timeTick)
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

  -- Printing the timer
  UtilText.print("Time: " .. game.store.time, "right", "up", { r = 255, g = 255, b = 255, a = 255 }, { fnt = global.assets.fonts.large, preserve = true })

  -- Drawing the coin
  EntityCoin:draw()

  -- Drawing the player
  EntityPlayer:draw()

  -- Printing the pausing state
  if global.paused == true and self.store.flicker == true then
    UtilText.print("Game Paused", "center", "center", { r = 255, g = 255, b = 255, a = 255, preserve = true }, { fnt = global.assets.fonts.large, preserve = true })
    UtilText.print("Press 'P' to resume the game!", "center", 330, { r = 255, g = 255, b = 255, a = 255, preserve = true }, { fnt = global.assets.fonts.small, preserve = true })
  end
end



--[[
  @description Collects a collated coin
  @param {Table} self: The table that invokes the function call
  @param {Number} index: The index of the coin to collect
]]
function game:collectCoin(index)

  -- Getting the value of the collected coin
  local coinValue = EntityCoin.definitions[EntityCoin.coins[index].id].value

  -- Increasing the player' score
  EntityPlayer.score = EntityPlayer.score + coinValue

  -- Incrementing the time
  game.store.time = game.store.time + coinValue

  -- Removing the collected coin
  EntityCoin:remove(index)

  -- Playing a complementory sound effect
  UtilAudio:play("effects", "coin")
end



--[[
  @description Called when the scene is navigated away from
]]
function game:leave()

  -- Stopping the active timers
  EntityCoin:resetTimer()
  UtilTimer:finish("game_flicker")
  UtilTimer:finish("game_time")
end



--[[
  @description Flicker timer event handler
]]
function flickerTimerEnded()

  -- Toggling the flicker status
  game.store.flicker = not game.store.flicker
end



--[[
  @description Time tick event handler
]]
function timeTick()

  -- Checking if the play still has time
  if (game.store.time > 0 and global.paused == false) then

    -- Decrementing the time
    game.store.time = game.store.time - 1
  end

  -- Checking if the player is out of time
  if (game.store.time == 0) then
    game.setActiveScene(2, { score = EntityPlayer.score })
  end
end



return game
