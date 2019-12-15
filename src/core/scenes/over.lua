--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilText = require("core.utils.text")
local UtilBackground = require("core.utils.background")

local over = {
  meta = {
    id = 2,
    name = "over",
    active = false,
    default = false
  },
  events = {
    setActiveScene = function() end
  },
  store = {
    flicker = true,
    score = 0
  }
}



--[[
  @description Over scene initialization
  @param {Table} self: The table that invokes the function call
  @param {Table} events: A table that holds outer event handlers
  @param {Table} params: A table that holds the passed parameters
]]
function over.init(self, events, params)

  -- Marking the game as over
  global.over = true

  -- Recieving the event handlers
  self.setActiveScene = events.setActiveScene

  -- Assinging the score
  self.store.score = params.score
end



--[[
  @description Over scene update
  @param {Table} self: The table that invokes the function call
  @param {Number} dt: Delta time
]]
function over.update(self, dt) end



--[[
  @description Over scene drawing
  @param {Table} self: The table that invokes the function call
]]
function over.draw(self)

  -- Tiling the background
  UtilBackground.tile(global.assets.gfx.bg.ground, 0, 0, "cover")

  -- Printing 'Cöin' on the screen
  UtilText.print("Game Over", "center", 170, { r = 252, g = 10, b = 10, a = 255, preserve = true }, { fnt = global.assets.fonts.huge, preserve = true })

  -- Printing the score message on the screen
  UtilText.print("You scored " .. self.store.score, "center", 320, { r = 252, g = 109, b = 25, a = 255 }, { fnt = global.assets.fonts.large, preserve = true })

  -- Printing the starting message on the screen
  UtilText.print("Press SPACE to start!", "center", 380, { r = 255, g = 255, b = 255, a = 255 }, { fnt = global.assets.fonts.large, preserve = true })
end



--[[
  @description Called when the scene is navigated away from
]]
function over:leave() end



return over
