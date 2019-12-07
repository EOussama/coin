--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]


local loader = {}

function loader.loadAssets()
  loader.loadGFX()
  loader.loadSFX()
  loader.loadFonts()
end

function loader.loadGFX()
  local gfxDir = "/assets/gfx/"
  
  global.assets.gfx.bg.ground = love.graphics.newImage(gfxDir .. "bg/ground.png")
end

function loader.loadSFX()
  local sfxDir = "/assets/sfx/"

  global.assets.sfx.ambient.music = love.audio.newSource(sfxDir .. "ambient/music.wav", "static")
end

function loader.loadFonts()
  local fontsDir = "/assets/fonts/"

  global.assets.fonts = {
    small = love.graphics.newFont(fontsDir .. "Gamer.ttf", 30),
    large = love.graphics.newFont(fontsDir .. "Gamer.ttf", 60),
    huge = love.graphics.newFont(fontsDir .. "Gamer.ttf", 120)
  }
end

return loader
