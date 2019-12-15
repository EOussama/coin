--[[

  @Author:            Eoussama
  @Version:           v0.0.1
  @Creation date:     6/12/2019 - 11:24PM

]]

local timers = {}



--[[
  @description Starts a new timer
  @param {Table} self: The table that invokes the function call
  @param {String} name: The name of the timer
  @param {Number} time: The duration of the timer in milliseconds
  @param {Boolean} loop: Whether or not to loop the timer once it's finished
  @param {Function} callback: The function to call when the timer finishes
]]
function timers.start(self, name, time, loop, callback)

  -- Sanitizing the name
  if name == nil then name = "" end

  -- Sanitizing the loop
  if loop == nil then loop = false end

  -- Sanitizing the callback
  if callback == nil then callback = function() end end

  -- Checking if a timer with the input name already exists
  if self:get(name) then

    -- Restarting the timer in case it already exists instead of recreating it
    self:restart(name)
  else

    -- Creating a timer
    local timer = {
      id = #self + 1,
      name = name,
      tick = 0,
      loop = loop,
      time = time,
      started = true,
      finished = false,
      callback = callback
    }
  
    -- Inserting the created timer in the timers collection
    table.insert(self, timer)
  end
end



--[[
  @description Restarts a timer
  @param {Table} self: The table that invokes the function call
  @param {String} name: The name of the timer to restart
]]
function timers.restart(self, name)

  -- Getting a timer that matches the input name
  local timer = self:get(name)

  -- Checking if the timer is valid
  if timer ~= nil then

    -- Resetting the timer's tick
    timer.tick = 0

    -- Resetting the timer' starting state
    timer.started = true

    -- Resetting the timer' finishing state
    timer.finished = false
  end
end



--[[
  @description Stops/finishes a timer
  @param {Table} self: The table that invokes the function call
  @param {String} name: The name of the timer to finish
  @param {Boolean} executeCallback: Whether or not to execute the callback
]]
function timers.finish(self, name, executeCallback)

  local extClbck = executeCallback or false

  -- Looping through all available timers
  for i = 1, #self, 1 do

    -- Temporarily dumping the iterated timer
    local timer = self[i]

    -- Checking if the iterated timer's name matches the input name
    if timer.name == name then

      -- Updating the starting state
      timer.started = true

      -- Updating the finishing state
      timer.finished = true

      -- Calling the finishing callback
      if extClbck == true then
        timer.callback()
      end

      -- Brealking out of jail
      break
    end
  end
end



--[[
  @description The timers' updating life-cycle event
  @param {Table} self: The table that invokes the function call
  @param {Number} dt: Delta time
]]
function timers.update(self, dt)

  -- Looping through the available timers
  for i = 1, #self, 1 do

    -- Dumping the interated timer into a temporary variable
    local timer = self[i]

    -- Checking if the iterated timer is runing
    if timer.started == true and timer.finished == false then

      -- Increasing the timer's tick
      timer.tick = timer.tick + dt * 1000
  
      -- Checking of the timer has reached its end
      if timer.tick >= timer.time then

        -- Finishing the timer
        self:finish(timer.name, true)
        
        -- Checking if the timer is set on an active loop
        if timer.loop == true then

          -- Restarting the timer
          self:restart(timer.name)
        end
      end
    end
  end
end



--[[
  @description Gets a timer by name
  @param {Table} self: The table that invokes the function call
  @param {String} name: The name of the timer to get
]]
function timers.get(self, name)

  -- Looping through the available timers
  for i = 1, #self, 1 do

    -- Dumping the iterated timer into a temporary variable
    local timer = self[i]

    -- Checking if the timers' names match
    if timer.name == name then

      -- Returning the matching timer
      return timer
    end
  end

  -- Returning 'nil' as a fallback value
  return nil
end

return timers
