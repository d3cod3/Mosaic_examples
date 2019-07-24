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
-- Mosaic port to Processing examples [http://www.processing.org]
--
-- Array 2D.
--
-- Demonstrates the syntax for creating a two-dimensional (2D) array.
-- Values in a 2D array are accessed through two index values.
-- 2D arrays are useful for storing images. In this example, each dot
-- is colored in relation to its distance from the center of the image.
--
--
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
-----------------------

distances = {}
maxDistance = 0
spacer = 20

----------------------------------------------------
function setup()
	maxDistance = of.dist(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2, OUTPUT_WIDTH,OUTPUT_HEIGHT)
	loc = 0
	for i=0,OUTPUT_HEIGHT-1 do
		for j=0,OUTPUT_WIDTH-1 do
			_distance = of.dist(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2,j,i)
			distances[loc] = _distance/maxDistance * 255
			loc = loc + 1
		end
	end
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)
	of.noFill()

	-- This embedded loop skips over values in the arrays based on
	-- the spacer variable, so there are more values in the array
	-- than are drawn here. Change the value of the spacer variable
	-- to change the density of the points
	loc = 0
	for i=0,OUTPUT_HEIGHT-1,spacer do
		for j=0,OUTPUT_WIDTH-1,spacer do
			of.setColor(distances[loc])
			of.drawCircle(j+spacer/2,i+spacer/2,1)
		end
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
