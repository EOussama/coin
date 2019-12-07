--[[

  @Author:        Eoussama
  @Version:       v0.0.1
  @Creation date:    6/12/2019 - 11:24PM

]]

function love.conf(t)
  -- Love2D configuration
  t.version = '11.0'
  -- t.console = true

  -- Game information
  t.window.title = "Cöin"
  t.window.icon = "assets/gfx/coin/coin.png"
  t.window.display = 1
  t.window.width = 800
  t.window.height = 600

  -- Modules
  t.modules.joystick = false
  t.modules.thread = false  
  t.modules.touch = false   
  t.modules.video = false   
  t.modules.data = false    
end
