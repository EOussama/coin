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
  print("Loading GFX...")
end

function loader.loadSFX()
  print("Loading SFX...")
end

function loader.loadFonts()
  local fontsDir = "/assets/fonts/"

  settings.assets.fonts = {
    small = love.graphics.newFont(fontsDir .. "Gamer.ttf", 30),
    large = love.graphics.newFont(fontsDir .. "Gamer.ttf", 60),
    huge = love.graphics.newFont(fontsDir .. "Gamer.ttf", 120)
  }
end

return loader
