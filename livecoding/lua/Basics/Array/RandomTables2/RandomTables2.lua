--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2019 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--  freedoms to use Mosaic in any context: commercial or non-commercial,
--  public or private, open or closed source.
--
--  See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--	RandomTables2.lua
--
-- This example shows how to create and use a table.
--
-- created by n3m3da & mj
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

myTable = {}
numObjects = 200
----------------------------------------------------
function setup()
	of.setCircleResolution(60)

	for i = 1, numObjects do
		myTable[i] = {}
		myTable[i].x = of.randomuf()*OUTPUT_WIDTH
		myTable[i].y = of.randomuf()*OUTPUT_HEIGHT
		myTable[i].diam = of.random(0,OUTPUT_WIDTH/2)
		myTable[i].a = of.random(5,120)
	end
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.enableAlphaBlending()
	of.noFill()
	for i = 1, numObjects do
		of.setColor(255,0,0,myTable[i].a)
		of.drawCircle(myTable[i].x, myTable[i].y, myTable[i].diam)
		of.drawCircle(myTable[i].x, myTable[i].y, myTable[i].diam+1.3)
	end
	of.disableAlphaBlending()
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
