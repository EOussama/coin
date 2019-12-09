--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local animation = {}



--[[
  @description Creates an animation table
]]
function animation:create(image, x, y, width, height, speed)
  local anim = {
    spriteSheet = image,
    quad = {},
    x = x or 0,
    y = y or 0,
    width = width or image:getWidth(),
    height = height or image:getHeight(),
    speed = speed or 500
  }

  function anim:animate()
  end

  return anim
end



return animation
