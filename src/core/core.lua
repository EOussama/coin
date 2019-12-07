--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local UtilLoader = require("core.utils.loader")

local SceneTitle = require("core.scenes.title")
local SceneGame = require("core.scenes.game")

local core = {
  scene = ''
}

function core.init()
  UtilLoader:loadAssets()

  SceneTitle:init()
  SceneGame:init()

  core.scene = SceneTitle.name
end

function core.update(dt)
  if core.scene == "title" then
    SceneTitle:update(dt)
  elseif core.scene == "game" then
    SceneGame:update(dt)
  end
end

function core.draw()
  if core.scene == "title" then
    SceneTitle:draw()
  elseif core.scene == "game" then
    SceneGame:draw()
  end
end

return core
