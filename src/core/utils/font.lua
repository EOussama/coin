--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local font = {
  cachedFont = nil
}

function font.get()
  return love.graphics.getFont()
end

function font.set(fnt, preserve)
  if preserve == true then
    font.cachedFont = font.get()
  end

  love.graphics.setFont(fnt)
end

function font.restore()
  if font.cachedFont ~= nil then
    font.set(font.cachedFont, nil)
  end
end

return font
