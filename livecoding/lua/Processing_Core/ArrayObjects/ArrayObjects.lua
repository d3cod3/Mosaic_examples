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
-- Mosaic port to Processing examples [http://www.processing.org]
--
-- Array Objects.
--
-- Demonstrates the syntax for creating an array of custom objects.
--
--
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

require("Module")

-- variables for mouse interaction  (DO NOT DELETE)
mouseX = 0
mouseY = 0
-----------------------------
unit = 40
count = 0
modules = {}
----------------------------------------------------
function setup()
  wideCount = OUTPUT_WIDTH/unit
  highCount = OUTPUT_HEIGHT/unit
  count = wideCount*highCount
  index = 0
  for y=0, highCount-1 do
    for x=0, wideCount-1 do
      modules[index] = Module(x*unit,y*unit,unit/2,unit/2,of.random(0.05,0.8),unit)
      index = index + 1
    end
  end
end

----------------------------------------------------
function update()
  for i=0,count-1 do
    modules[i]:update()
  end
end

----------------------------------------------------
function draw()
  of.background(0)
  for i=0,count-1 do
    modules[i]:draw()
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
