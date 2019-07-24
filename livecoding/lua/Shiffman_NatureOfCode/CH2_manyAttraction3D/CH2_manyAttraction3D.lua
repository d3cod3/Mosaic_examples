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
--  Shiffman_NatureOfCode/CH2_manyAttraction3D.lua
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

-- variables for mouse interaction  (DO NOT DELETE)
mouseX = 0
mouseY = 0

lights = of.Light()
diffuse = of.FloatColor(1.0,1.0,1.0,0.4)

g = 1
NUM_MOVERS = 10
movers = {}
force = of.Vec3f()
theta = 0

----------------------------------------------------
function setup()
  of.setSphereResolution(8)
  for i=0,NUM_MOVERS-1 do
    movers[i] = Mover(of.random(3,12),of.random(-OUTPUT_WIDTH/2,OUTPUT_WIDTH/2),of.random(-OUTPUT_HEIGHT/2,OUTPUT_HEIGHT/2),of.random(-200,100))
  end
  a = Attractor()
end

----------------------------------------------------
function update()
  for i=0,NUM_MOVERS-1 do
    force = a:attract(movers[i])
    movers[i]:applyForce(force)
    movers[i]:update()
  end

  theta = theta - 0.3
end

----------------------------------------------------
function draw()
  of.background(64,128,255)

  lights:enable()
  lights:setDiffuseColor(diffuse)

  of.translate(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2,0)
  of.rotateYDeg(theta)
  a:draw()

  for i=0,NUM_MOVERS-1 do
    movers[i]:draw()
  end
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
end

function mouseReleased(x,y)

end

function mouseScrolled(x,y)

end
