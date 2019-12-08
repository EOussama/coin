--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]


local loader = {}



--[[
  @description Loads the game's assets
]]
function loader.loadAssets()

  -- Loading graphical assets
  loader.loadGFX()

  -- Loading vocal assets
  loader.loadSFX()

  -- Loading font assets
  loader.loadFonts()
end



--[[
  @description Loads the GFX assets
  ]]
  function loader.loadGFX()
    
    -- Defining the GFX directory
    local gfxDir = "/assets/gfx/"
    
    -- Loading the ground asset
    global.assets.gfx.bg.ground = love.graphics.newImage(gfxDir .. "bg/ground.png")
    
    -- Loading the coin asset
    global.assets.gfx.entities.coin = love.graphics.newImage(gfxDir .. "coin/coin.png")
    
    -- Loading the player assets
    global.assets.gfx.entities.player = {
      up = love.graphics.newImage(gfxDir .. "player/up.png"),
      right = love.graphics.newImage(gfxDir .. "player/right.png"),
      down = love.graphics.newImage(gfxDir .. "player/down.png"),
      left = love.graphics.newImage(gfxDir .. "player/left.png")
    }
  end
  
  
  
--[[
  @description Loads the SFX assets
]]
function loader.loadSFX()

  -- Defining the SFX directory
  local sfxDir = "/assets/sfx/"

  -- Loading the background music
  global.assets.sfx.ambient.music = love.audio.newSource(sfxDir .. "ambient/music.wav", "stream")

  -- Loading the coin collection sound effect
  global.assets.sfx.effects.coin = love.audio.newSource(sfxDir .. "effects/coin.ogg", "static")
end



--[[
  @description Loads the font assets
]]
function loader.loadFonts()

  -- Defining the font directory
  local fontsDir = "/assets/fonts/"

  -- Loading the Gamer font
  global.assets.fonts = {
    small = love.graphics.newFont(fontsDir .. "Gamer.ttf", 30),
    large = love.graphics.newFont(fontsDir .. "Gamer.ttf", 60),
    huge = love.graphics.newFont(fontsDir .. "Gamer.ttf", 120)
  }
end



return loader
