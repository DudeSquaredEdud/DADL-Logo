local moonshine = require 'moonshine'

function love.load()
  love.window.setMode(1920, 1080)

  backgroundEffect = moonshine(moonshine.effects.boxblur)
  .chain(moonshine.effects.posterize)
  .chain(moonshine.effects.scanlines)
  .chain(moonshine.effects.pixelate)
  backgroundEffect.pixelate.size = {3,3}
  backgroundEffect.scanlines.thickness = .3
  backgroundEffect.scanlines.opacity = .1
  backgroundEffect.posterize.num_bands = 90

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
  backgroundEffect.boxblur.radius = {(math.abs(math.sin(time*.1)*math.sin(time*.1)*700))+.1,1}
  backgroundEffect.scanlines.phase = time*5

  scanlinesEffect.scanlines.phase = time*10

end