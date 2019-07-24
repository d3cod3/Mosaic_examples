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
--
--   Shiffman_NatureOfCode/CH0_NoiseLandscape.lua
--
--  This example is one of the series of Mosaic adaptation to
--  Daniel Shiffman <Nature of Code> book examples.
--
--  More info: <http://natureofcode.com/>
--
--  created by n3m3da | www.d3cod3.org
--
--

require("Landscape")

-- variables for mouse interaction  (DO NOT DELETE)
mouseX = 0
mouseY = 0

theta = 0
land = 0
----------------------------------------------------
function setup()
  land = Landscape(80,OUTPUT_WIDTH,OUTPUT_HEIGHT)
end

----------------------------------------------------
function update()
  land:update()
  theta = theta + 0.0025
end

----------------------------------------------------
function draw()
  of.background(255)
  of.pushMatrix()
  of.translate(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2,-300)
  --  ofRotateX(ofRadToDeg(PI/3))
  of.rotateXRad(of.PI/3)
  -- ofRotateZ(ofRadToDeg(theta))
  of.rotateZRad(theta)
  land:draw()
  of.popMatrix()

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
-------------
-------------
