--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local audio = {}



--[[
  @description Plays an audio track
  @param {Table} self: The table that invokes the function call
  @param {String} type: The type of the audio to play (uses the names of the keys of the table 'global.assets.sfx')
  @param {String} name: The name of the audio to play (uses the names of the keys of the table 'global.assets.sfx[type]')
  @param {Number} volume: The volume to play the audio track at
  @param {Boolean} loop:  Wether or not to loop the audio track
]]
function audio.play(self, type, name, volume, loop)

  -- Checking if the input audio type and name are valid
  if (global.assets.sfx[type] ~= nil and global.assets.sfx[type][name] ~= nil) then

    -- Sanitizing the volume value
    if volume == nil then volume = 0.5 end

    -- Sanitizing the loop value
    if loop == nil then loop = false end
    
    -- Stoping the audio track in case it was already playing
    self:stop(type, name)
    
    -- Setting the loop value of the audio track
    global.assets.sfx[type][name]:setLooping(loop)
    
    -- Setting the volume of the audio track
    global.assets.sfx[type][name]:setVolume(volume)
    
    -- Playing the audio track
    global.assets.sfx[type][name]:play()
  end
end



--[[
  @description Stops an audio track
  @param {Table} self: The table that invokes the function call
  @param {String} type: The type of the audio to stop (uses the names of the keys of the table 'global.assets.sfx')
  @param {String} name: The name of the audio to stop (uses the names of the keys of the table 'global.assets.sfx[type]')
]]
function audio.stop(self, type, name)

  -- Checking if the input audio type and name are valid
  if (global.assets.sfx[type] ~= nil and global.assets.sfx[type][name] ~= nil) then

    -- Stoping the audio track
    global.assets.sfx[type][name]:stop()
  end
end



return audio
