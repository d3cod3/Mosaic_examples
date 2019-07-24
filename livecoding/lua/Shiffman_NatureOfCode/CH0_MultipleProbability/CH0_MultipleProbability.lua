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
--	Shiffman_NatureOfCode/CH0_MultipleProbability.lua

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

p1 = 0.05
p2 = 0.8 + p1
num = 0
x = 0
y = 0
d = 20
----------------------------------------------------
function setup()

end

----------------------------------------------------
function update()
	num = of.randomuf()

	x = (x+d)%OUTPUT_WIDTH
	if x == 0 then
		y = (y+d)%OUTPUT_WIDTH
		if y > OUTPUT_HEIGHT then
			y = 0
		end
	end
end

----------------------------------------------------
function draw()
	of.background(64,128,255)

	of.fill()
	if num < p1 then
		of.setColor(8,0,64)
	elseif num < p2 then
		of.setColor(32, 0, 255)
	else
		of.setColor(64,128,255)
	end
	of.drawRectangle(x,y,d,d)
	of.noFill()
	of.setColor(8,0,64)
	of.drawRectangle(x,y,d,d)
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
