--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local collision = {}



--[[
  @description Sets the background's image
  @param {Number} x1: The first x position
  @param {Number} y1: The first y position
  @param {Number} x2: The second x position
  @param {Number} y2: The second y position
]]
function collision.check(a, b)
  return 
    a.x < b.x + b.width   and
    a.x + a.width > b.x   and
    a.y < b.y + b.height  and
    a.y + a.height > b.y
end



return collision
