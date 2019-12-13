--[[

  @Author:        Eoussama
  @Version:       v0.0.1
  @Creation date:    6/12/2019 - 11:24PM

]]



--[[
  @description Global configurtions
  @param {Table} t: Love2D's configuration table
]]
function love.conf(t)
  
  -- Specifying the used version of Love2D
  t.version = '11.0'

  -- Enableling the console
  t.console = true

  -- Setting up the window's title
  t.window.title = "Cöin"

  -- Setting up the window's icon
  t.window.icon = "assets/gfx/coins/coin.png"

  -- Setting up the starting display
  t.window.display = 1
  
  -- Setting up the screen width
  t.window.width = 800

  -- Setting up the screen height
  t.window.height = 600 
end
