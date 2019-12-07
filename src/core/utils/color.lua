--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local color = {
  cachedColor = nil
}

function color.get()
  local r, g, b, a = love.graphics.getColor()
  return { r = r * 100, g = g * 100, b = b * 100, a = a * 100}
end

function color.set(clr, preserve)
  if preserve == true then
    color.cachedColor = color.get()
  end

  love.graphics.setColor(clr.r / 100, clr.g / 100, clr.b / 100, clr.a / 100)
end

function color.rgba(r, g, b, a, preserve)
  color.set({ r = r, g = g, b = b, a = a}, preserve)
end

function color.restore()
  if color.cachedColor ~= nil then
    color.set(color.cachedColor, nil)
  end
end

return color
