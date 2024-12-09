local moonshine = require 'moonshine'
local scanLinesEffect = moonshine(moonshine.effects.dmg)
  .chain(moonshine.effects.scanlines)
  .chain(moonshine.effects.pixelate)

function love.load()
  love.window.setMode(1920, 1080)

  scanLinesEffect = moonshine(moonshine.effects.boxblur)
  .chain(moonshine.effects.posterize)
  .chain(moonshine.effects.scanlines)
  .chain(moonshine.effects.crt)
  .chain(moonshine.effects.pixelate)
  scanLinesEffect.pixelate.size = {3,3}
  scanLinesEffect.scanlines.thickness = .3
  scanLinesEffect.scanlines.opacity = .1
  scanLinesEffect.posterize.num_bands = 100

  glowEffect = moonshine(moonshine.effects.scanlines)
  .chain(moonshine.effects.pixelate)
  .chain(moonshine.effects.glow)
  .chain(moonshine.effects.crt)
  glowEffect.pixelate.size = {3,3}
  glowEffect.scanlines.thickness = .5
  glowEffect.scanlines.opacity = .1
  glowEffect.crt.distortionFactor = {1.06, 1.065}


  back = love.graphics.newImage("back_dadl.png")
  dadl = love.graphics.newImage("dadl.png")
end


function love.draw()

    scanLinesEffect(function()
      love.graphics.draw(back, 0, 0)
    end)

    glowEffect(function()
      love.graphics.draw(dadl, 0, 0)
    end)
end

function love.update(dt)
  time = love.timer.getTime()
  scanLinesEffect.boxblur.radius = {(math.abs(math.sin(time*.1)*math.sin(time*.1)*700))+.1,1}
  scanLinesEffect.scanlines.phase = time*5

  glowEffect.scanlines.phase = time*5

end