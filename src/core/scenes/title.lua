--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilText = require("core.utils.text")
local UtilAudio = require("core.utils.audio")
local UtilTimer = require("core.utils.timer")

local title = {
  meta = {
    id = 0,
    name = "title",
    active = false,
    default = false
  },
  events = {
    setActiveScene = function() end,
    flickerTimerEnded = function() end
  },
  store = {
    flicker = true,
    time
  }
}



--[[
  @description Title scene initialization
  @param {Table} self: The table that invokes the function call
  @param {Table} events: A table that holds outer event handlers
]]
function title.init(self, events)

  -- Recieving the event handlers
  self.setActiveScene = events.setActiveScene

  -- Playing ambient music
  UtilAudio.play("ambient", "music", 0.2, true)

  -- Starting a timer for flickering
  UtilTimer:start("flicker", 200, true, flickerTimerEnded)
end



--[[
  @description Title scene update
  @param {Table} self: The table that invokes the function call
  @param {Number} dt: Delta time
]]
function title.update(self, dt)

  -- Updating the timer
  UtilTimer:update(dt)
end



--[[
  @description Global keyboard input listener
  @param {String} key: The pressed key
]]
function love.keypressed(key)

  -- Checking of the 'space' key was pressed
  if key == 'space' and title.meta.active == true then

    -- Navigating to the 'game' scene
    title.setActiveScene(1)
  end
end



--[[
  @description Title scene drawing
  @param {Table} self: The table that invokes the function call
]]
function title.draw(self)

  -- Printing 'Cöin' on the screen
  UtilText.print("Cöin", "center", 150, { r = 245, g = 158, b = 27, a = 255, preserve = true }, { fnt = global.assets.fonts.huge, preserve = true })
  
  -- Checking the visibility of the flicker
  if self.store.flicker == true then

    -- Printing the starting message on the screen
    UtilText.print("Press SPACE to start!", "center", 250, { r = 255, g = 255, b = 255, a = 255 }, { fnt = global.assets.fonts.large, preserve = true })
  end
end



--[[
  @description Flicker timer event handler
]]
function flickerTimerEnded()

  -- Toggling the flicker status
  title.store.flicker = not title.store.flicker
end

return title
