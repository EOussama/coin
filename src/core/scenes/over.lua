--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilText = require("core.utils.text")
local UtilAudio = require("core.utils.audio")
local UtilTimer = require("core.utils.timer")
local UtilBackground = require("core.utils.background")

local title = {
  meta = {
    id = 2,
    name = "over",
    active = false,
    default = false
  },
  events = {
    setActiveScene = function() end
  }
}



--[[
  @description Over scene initialization
  @param {Table} self: The table that invokes the function call
  @param {Table} events: A table that holds outer event handlers
]]
function title.init(self, events)

  -- Recieving the event handlers
  self.setActiveScene = events.setActiveScene
end



--[[
  @description Over scene update
  @param {Table} self: The table that invokes the function call
  @param {Number} dt: Delta time
]]
function title.update(self, dt)
end



--[[
  @description Over scene drawing
  @param {Table} self: The table that invokes the function call
]]
function title.draw(self)
  
  -- Tiling the background
  UtilBackground.tile(global.assets.gfx.bg.ground, 0, 0, "cover")
end



return title
