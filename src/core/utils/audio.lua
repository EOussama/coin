--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local audio = {}

function audio.play(type, name, volume, loop)
  if (global.assets.sfx[type] ~= nil and global.assets.sfx[type][name] ~= nil) then
    if volume == nil then volume = 0.5 end
    if loop == nil then loop = false end

    global.assets.sfx[type][name]:play()
    global.assets.sfx[type][name]:setLooping(loop)
    global.assets.sfx[type][name]:setVolume(volume)
  end
end

function audio.stop(name, type)
  if (global.assets.sfx[type] ~= nil and global.assets.sfx[type][name] ~= nil) then
    global.assets.sfx[type][name]:stop()
  end
end

return audio
