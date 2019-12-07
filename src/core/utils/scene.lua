--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local SceneTitle = require("core.scenes.title")
local SceneGame = require("core.scenes.game")

local scenes = {}

function scenes.init()
  scenes.register(SceneTitle, true)
  scenes.register(SceneGame)
  
  scenes.setActiveScene()
end

function scenes.update(dt)
  local activeScene = scenes.getActiveScene()

  if activeScene ~= nil then
    activeScene:update(dt)
  end
end

function scenes.draw()
  local activeScene = scenes.getActiveScene()

  if activeScene ~= nil then
    activeScene:draw(dt)
  end
end

function scenes.register(scene, default)
  scene:init()
  table.insert(scenes, scene)

  if default == true then
    scenes.setDefaultScene(scene)
  end
end

function scenes.setActiveScene(sceneId)
  if sceneId == nil then
    local defScene = scenes.getDefaultScene()

    if defScene ~= nil then
      defScene.active = true
    end
  else
    for i = 1, #scenes, 1 do
      local tmpScene = scenes[i]

      if sceneId == tmpScene.id then
        tmpScene.active = true
      else
        tmpScene.active = false
      end
    end
  end
end

function scenes.getActiveScene()
  for i = 1, #scenes, 1 do
    local scene = scenes[i]

    if scene.active == true then
      return scene
    end
  end

  return nil
end

function scenes.setDefaultScene(scene)
  for i = 1, #scenes, 1 do
    local tmpScene = scenes[i]

    if scene.id == tmpScene.id then
      tmpScene.default = true
    else
      tmpScene.default = false
    end
  end
end

function scenes.getDefaultScene()
  for i = 1, #scenes, 1 do
    local scene = scenes[i]

    if scene.default == true then
      return scene
    end
  end

  return nil
end

return scenes
