--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local rarity = {}



--[[
  @description Calculates the rarity given a specific input
  @param {Table<Number>} rarity: The rarity table
]]
function rarity.calculate(rarity)

  -- Initializing the rarity table
  local rarityTable = {}

  -- Sorting the rarity values
  table.sort(rarity)

  print(table.concat(rarity, ' '))

  return rarityTable
end



return rarity
