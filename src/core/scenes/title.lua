--[[

  @Author:        Eoussama
  @Version:       v0.0.1
  @Creation date:    6/12/2019 - 11:24PM

]]

local title = {
  name = "title"
}

function title.update(dt)
end

function title.draw()
  love.graphics.print("Title screen", 0, 0)
end

return title
