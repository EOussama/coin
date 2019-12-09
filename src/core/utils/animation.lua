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
    quads = {},
    x = x or 0,
    y = y or 0,
    width = width or 0,
    height = height or 0,
    speed = speed or 500
  }

  for i = 0, anim.spriteSheet:getHeight() - anim.height, anim.height do
    for j = 0, anim.spriteSheet:getWidth() - anim.width, anim.width do
        table.insert(anim.quads, love.graphics.newQuad(i, j, anim.width, anim.height, anim.spriteSheet:getDimensions()))
    end
  end

  function anim:animate()
  end

  return anim
end



return animation
