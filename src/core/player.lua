local player = {
  x = 0,
  y = 50,
  direction = 0,
  score = 0,
  velocity = 15
}

function player.update(dt)
  if love.keyboard.isDown("up") and player.y > 0 then
    player.y = player.y - player.velocity
  end

  if love.keyboard.isDown("right") and player.x < love.graphics.getWidth() - 50 then
    player.x = player.x + player.velocity
  end

  if love.keyboard.isDown("down") and player.y < love.graphics.getHeight() - 50 then
    player.y = player.y + player.velocity
  end

  if love.keyboard.isDown("left") and player.x > 0 then
    player.x = player.x - player.velocity
  end
end

function player.draw()
  love.graphics.print("X: " .. player.x, 0, 500)
  love.graphics.print("Y: " .. player.y, 0, 520)
  love.graphics.print("Width: " .. love.graphics.getWidth(), 0, 540)
  love.graphics.print("Height: " .. love.graphics.getHeight(), 0, 560)
  love.graphics.rectangle("fill", player.x, player.y, 50, 50)
end

return player
