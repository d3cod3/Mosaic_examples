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
--  Shiffman_NatureOfCode/CH1_9_motionAcceleration.lua
--
--  This example is one of the series of GAmuza adaptation to
--  Daniel Shiffman <Nature of Code> book examples.
--
--  More info: <http://natureofcode.com/>
--
--  created by n3m3da | www.d3cod3.org
--	translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--

-- import required class (IMPORTANT, you'll need the ClassTemplate.lua in the same folder!!!)
require("Mover")

-- variables for mouse interaction  (DO NOT DELETE)
mouseX = 0
mouseY = 0

----------------------------------------------------
function setup()
  mover = Mover()
end

----------------------------------------------------
function update()
  mover:update()
  mover:checkEdges()
end

----------------------------------------------------
function draw()
  of.background(64,128,255)
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
end

function mouseReleased(x,y)

end

function mouseScrolled(x,y)

end
