--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilLoader = require("core.utils.loader")
local UtilScene = require("core.utils.scene")
local UtilTimer = require("core.utils.timer")

local core = {}



--[[
  @description Initializes the game
]]
function core.init()

  -- Loading the assets
  UtilLoader:loadAssets()

  -- Initializing the game
  UtilScene:init()
end



--[[
  @description Updates the game
  @param {Table} self: The table that invokes the function call
  @param {Number} dt: Delta time
]]
function core.update(self, dt)

  -- Updating the timer utility
  UtilTimer:update(dt)

  -- Updating the scene utility
  UtilScene:update(dt)
end



--[[
  @description Drawing the game
]]
function core.draw()
  UtilScene:draw()
end



--[[
  @description Listens to keyboard inputs
  @param {String} key: The key that was pressed
]]
function love.keypressed(key)

  -- Checking if the 'p' key was pressed
  if key == 'p' then

    -- Toggeling the game's pause status
    global.paused = not global.paused
  end

  -- Checking if the 'space' key was pressed
  if key == 'space' and global.over == true then

    -- Marking the game as not over
    global.over = false

    -- Starting the game
    UtilScene.setActiveScene(1)
  end

  -- Checking if the 'escape' key was pressed
  if key == 'escape' then

    -- Checking if the game is being played
    if UtilScene.getActiveScene().meta.id ~= 0 then

      -- Displaying the game's screen
      UtilScene.setActiveScene(0)
    else

      -- Exiting the game
      love.event.quit()
    end
  end
end



return core
