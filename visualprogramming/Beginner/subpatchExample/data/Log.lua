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
--	Log.lua

-- This example shows how to send logs to the Mosaic console.
-- In order to see the printing logs in real time you have to activate
-- the Logger in Menu>System>Logger
--
-- created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

number = 0
sendVar = false
gate = true

----------------------------------------------------
function setup()
	of.setCircleResolution(6)
end

----------------------------------------------------
function update()
	number = of.randomuf()
	if math.ceil(of.getElapsedTimef())%3 == 0 and gate then
		gate = false
		sendVar = true
		of.log(of.LOG_NOTICE, string.format("Number: %f",number))
	else
		sendVar = false
		gate = true
	end
end

----------------------------------------------------
function draw()
	of.background(0)
	of.setColor(255)
	if sendVar then
		of.drawCircle(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2,OUTPUT_HEIGHT/2*number)
	end
	text = string.format("Elapsed Time: %.3f",of.getElapsedTimef())
	of.drawBitmapString(text,20,240)
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
