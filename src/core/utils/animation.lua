--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local animation = {}



--[[
  @description Creates an animation table
]]
function animation:create(image, x, y, width, height, max, speed)
  local anim = {
    spriteSheet = image,
    quads = {},
    x = x or 0,
    y = y or 0,
    width = width or 0,
    height = height or 0,
    max = max or 0,
    speed = speed or 500,
    currentFrame = 0,
    tick = 0
  }

  for i = 0, max, anim.width do
      table.insert(anim.quads, love.graphics.newQuad(i, 0, anim.width, anim.height, anim.spriteSheet:getDimensions()))
  end
  
  function anim:update(dt)
    self.tick = self.tick + dt
    
    -- print(self.tick)
    if self.tick >= self.speed / 1000 then
      self.tick = 0
      self.currentFrame = self.currentFrame + 1
      
      if self.currentFrame >= max then
        self.currentFrame = 0
      end
    end
  end

  function anim:getQuad()
    print(#self.quads, self.currentFrame)
    return self.quads[self.currentFrame]
  end

  return anim
end



return animation
