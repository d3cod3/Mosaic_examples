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
-- Shiffman_NatureOfCode/CH0_RandomDistribution.ga
--
-- This example is one of the series of Mosaic adaptation to
-- Daniel Shiffman <Nature of Code> book examples.
--
-- More info: <http://natureofcode.com/>
--
-- created by n3m3da | www.d3cod3.org
--	translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

randomCounts = {}
numCounts = 20
w = 0
----------------------------------------------------
function setup()
	w = OUTPUT_WIDTH/numCounts

	of.seedRandom()
	for i=0, numCounts+1 do
		randomCounts[i] = 0
	end
end

----------------------------------------------------
function update()
	index = math.floor(of.random(numCounts))
	randomCounts[index] = randomCounts[index] + 2
end

----------------------------------------------------
function draw()
	of.background(64,128,255)

	of.setLineWidth(2)
	of.setColor(32, 0, 255)
	of.fill()
	for x=0,numCounts+1 do
		of.drawRectangle(x*w,OUTPUT_HEIGHT-randomCounts[x],w-1,randomCounts[x])
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
