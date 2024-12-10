local moonshine = require 'moonshine'

function love.load()
  love.window.setMode(1920, 1080)

  backgroundEffect = moonshine(moonshine.effects.boxsterize)
  .chain(moonshine.effects.pixelate)
  backgroundEffect.boxsterize.num_bands = 90

  scanlinesEffect = moonshine(moonshine.effects.scanlines)


  back = love.graphics.newImage("back_dadl.png")
  dadl = love.graphics.newImage("dadl.png")
end


function love.draw()

    backgroundEffect(function()
      love.graphics.draw(back, 0, 0)
    end)

    scanlinesEffect(function()
      love.graphics.draw(dadl, 0, 0)
    end)
end

function love.update(dt)
  time = love.timer.getTime()
  backgroundEffect.boxsterize.radius = {(math.abs(math.sin(time*.1)*math.sin(time*.2)*700))+1,1}

  scanlinesEffect.scanlines.phase = time*10

end