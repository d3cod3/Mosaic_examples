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
--  Shiffman_NatureOfCode/CH2_8_attractRepel.lua
--
--  This example is one of the series of GAmuza adaptation to
--  Daniel Shiffman <Nature of Code> book examples.
--
--  More info: <http://natureofcode.com/>
--
--  created by n3m3da | www.d3cod3.org
--  translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--

-- import required class (IMPORTANT, you'll need the ClassTemplate.lua in the same folder!!!)
require("Mover")
require("Attractor")

-- variables for mouse interaction  (DO NOT DELETE)
mouseX = 0
mouseY = 0

g = 1
NUM_MOVERS = 20
movers = {}
a = Attractor()
force = of.Vec2f()
----------------------------------------------------
function setup()
  of.setCircleResolution(50)
  for i=0,NUM_MOVERS-1 do
    movers[i] = Mover(of.random(4,12),of.random(OUTPUT_WIDTH),of.random(OUTPUT_HEIGHT))
  end
  a.loc = of.Vec2f(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2)
end

----------------------------------------------------
function update()
  a:drag()
  a:hover(mouseX,mouseY)
  for i=0,NUM_MOVERS-1 do
    for j=0,NUM_MOVERS-1 do
      if i ~= j then
        force = of.Vec2f()
        force = movers[j]:repel(movers[i])
        movers[i]:applyForce(force)
      end
    end

    force = a:attract(movers[i])
    movers[i]:applyForce(force)
    movers[i]:checkEdges()
    movers[i]:update()
  end
end

----------------------------------------------------
function draw()
  of.background(64,128,255)

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
  a:clicked(x,y)
end

function mouseReleased(x,y)
  a:stopDragging()
end

function mouseScrolled(x,y)

end
