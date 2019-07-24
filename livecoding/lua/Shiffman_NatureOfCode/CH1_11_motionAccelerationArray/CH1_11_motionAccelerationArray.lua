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
--  Shiffman_NatureOfCode/CH1_10_motionAcceleration.lua
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


-- variables for mouse interaction  (DO NOT DELETE)
mouseX = 0
mouseY = 0

mouse = of.Vec2f()
mover = {}
numMovers = 20

----------------------------------------------------
function setup()
  for i=1,numMovers do
    mover[i] = Mover()
  end
end

----------------------------------------------------
function update()
  mouse:set(mouseX,mouseY)
  for i=1,numMovers do
    mover[i]:update()
  end

end

----------------------------------------------------
function draw()
  of.background(64,128,255)
  for i=1,numMovers do
    mover[i]:draw()
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
