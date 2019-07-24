--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2018 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--  freedoms to use Mosaic in any context: commercial or non-commercial,
--  public or private, open or closed source.
--
--  See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--  Shiffman_NatureOfCode/CH2_6_attraction.lua
--
--  This example is one of the series of GAmuza adaptation to
--  Daniel Shiffman <Nature of Code> book examples.
--
--  More info: <http://natureofcode.com/>
--
--  created by n3m3da | www.d3cod3.org
--  translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--

require("Mover")
require("Attractor")

force = of.Vec2f()

-- variables for mouse interaction  (DO NOT DELETE)
mouseX = 0
mouseY = 0

----------------------------------------------------
function setup()
  of.setCircleResolution(50)
  mover = Mover()
  attractor = Attractor()
  attractor.loc = of.Vec2f(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2)
end

----------------------------------------------------
function update()
  force = attractor:attract(mover)
  mover:applyForce(force)
  mover:update()

  attractor:drag()
  attractor:hover(mouseX,mouseY)
end

----------------------------------------------------
function draw()
  of.background(64,128,255,246)

  attractor:draw()
  mover:draw()

end

----------------------------------------------------
function exit()

end


-- input callbacks

----------------------------------------------------
function keyPressed(key)

end

function keyReleased(key)

end

function mouseMoved(x,y)
  mouseX = x
  mouseY = y
end

function mouseDragged(x,y)
  mouseX = x
  mouseY = y
  attractor:clicked(x,y)
end

function mouseReleased(x,y)
  attractor:stopDragging()
end

function mouseScrolled(x,y)

end
------
