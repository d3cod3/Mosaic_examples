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
--	Shiffman_NatureOfCode/CH0_SimpleProbability.lua
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

prob = 0
r = 0
x = 0
y = 0
d = 10
----------------------------------------------------
function setup()

end

----------------------------------------------------
function update()
	prob = mouseX/OUTPUT_WIDTH
	r = of.randomuf()

	x = (x+(d*2))%OUTPUT_WIDTH
	if x == 0 then
		y = (y+(d*2))%OUTPUT_WIDTH
	end
end

----------------------------------------------------
function draw()
	of.background(64,128,255)
	if r < prob then
		of.setColor(32, 0, 255)
		of.drawCircle(x,y,d)
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
