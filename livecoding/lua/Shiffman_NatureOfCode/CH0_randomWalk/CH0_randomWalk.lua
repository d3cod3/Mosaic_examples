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
--	Shiffman_NatureOfCode/CH0_randomWalk.lua
--
--	This example is one of the series of Mosaic adaptation to
--	Daniel Shiffman <Nature of Code> book examples.
--
--	More info: <http://natureofcode.com/>
--
--	created by n3m3da | www.d3cod3.org
--	translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

walkers = {}
gWalkers = {}
numW = 300
----------------------------------------------------
function setup()
	for i=0,numW-1 do
		walkers[i] = {}
		walkers[i].x = OUTPUT_WIDTH/2
		walkers[i].y = OUTPUT_HEIGHT/2
		gWalkers[i] = {}
		gWalkers[i].x = OUTPUT_WIDTH/5
		gWalkers[i].y = OUTPUT_HEIGHT/5
	end
end

----------------------------------------------------
function update()
	for i=0,numW-1 do
		local rX = of.randomf()
		local rY = of.randomf()
		local grX = of.randomf()
		local grY = of.randomf()

		walkers[i].x = walkers[i].x + rX
		walkers[i].y = walkers[i].y + rY

		gWalkers[i].x = gWalkers[i].x + grX
		gWalkers[i].y = gWalkers[i].y + grY
	end
end

----------------------------------------------------
function draw()
	of.background(64,128,255)
	of.noFill()
	for i=0,numW-1 do
		of.setColor(8,0,64)
		of.drawRectangle(walkers[i].x,walkers[i].y,1,1)
		of.setColor(32, 0, 255)
		of.drawRectangle(gWalkers[i].x,gWalkers[i].y,1,1)
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
