--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local rarity = {}



--[[
  @description Calculates the rarity of an input
  @param {Number} rarityInput: The rarity input
  @param {Table<Number>} rarityValues: The rarity table
]]
function rarity.calculate(rarityInput, rarityValues)

  -- Generating a rarity table
  local rarityTable = rarity.generate(rarityValues)

  -- Initializing the rarity output bearer
  local output = nil

  for i = 1, #rarityTable do
    for j = 1, #rarityTable[i].values do
      if rarityTable[i].values[j] == rarityInput then
        output = rarityTable[i].id
        break
      end
    end
  end

  return output
end



--[[
  @description Generate a rarity table
  @param {Table<Number>} rarityValues: The rarity table
]]
function rarity.generate(rarityValues)

  -- Initializing the rarity table
  local rarityTable = {}

  -- Initializing the history object for the generated numbers
  local generatedNumbers = {}

  for i = 1, #rarityValues do
    local j = 1
    local rarityLevel = {
      id = rarityValues[i].id,
      rarity = rarityValues[i].rarity,
      values = {}
    }

    while j <= rarityLevel.rarity do
      local rand = math.random(1, 100)

      if rarity.contains(generatedNumbers, rand) == false then
        table.insert(generatedNumbers, rand)
        rarityLevel.values[j] = rand
        j = j + 1
      end
    end

    table.insert(rarityTable, rarityLevel)
  end

  return rarityTable
end



--[[
  @description Checks if a rarity table contain a value
  @param {Table<Number>} table: The rarity table
  @param {Number} val: The number to check
]]
function rarity.contains(table, val)

  for i = 1, #table do
    if table[i] == val then
      return true
    end
  end

  return false
end



return rarity
