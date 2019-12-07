--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local background = {}



--[[
  @description Sets the background's image
  @param {Tabel} image: The image to tile
  @param {Number} x: The starting x position
  @param {Number} y: The starting y position
  @param {String} mode: The tile mode (cover, horizontal, vertical)
]]
function background.tile(image, x, y, mode)

  -- Sanitizing the x param
  if x == nil then x = 0 end

  -- Sanitizing the y param
  if y == nil then y = 0 end

  -- Sanitizing the mode param
  if mode == nil then mode = "cover" end

  -- Checking the tile mode
  if mode == "cover" then
    for x = x, love.graphics.getWidth(), image:getWidth() do
      for y = y, love.graphics.getHeight(), image:getHeight() do

        -- Drawing a tile at the specified position
        love.graphics.draw(image, x, y)
      end
    end
  elseif mode == "horizontal" then
    for x = x, love.graphics.getWidth(), image:getWidth() do

      -- Drawing a tile at the specified position
      love.graphics.draw(image, x, y)
    end
  elseif mode == "vertical" then
    for y = y, love.graphics.getHeight(), image:getHeight() do

      -- Drawing a tile at the specified position
      love.graphics.draw(image, x, y)
    end
  end
end



return background
