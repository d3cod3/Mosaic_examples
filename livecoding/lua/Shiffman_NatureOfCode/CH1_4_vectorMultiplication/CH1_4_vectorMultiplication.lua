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
--	Shiffman_NatureOfCode/CH1_4_vectorMultiplication.lua
--
--	This example is one of the series of Mosaic adaptation to
--	Daniel Shiffman <Nature of Code> book examples.
--
--
--	created by n3m3da | www.d3cod3.org
--	translated from GAmuza examples by ferhoyo https://github.com/ferhoyo

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

mouse = of.Vec2f()
center = 0
----------------------------------------------------
function setup()
	center = of.Vec2f(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2)
end

----------------------------------------------------
function update()
	mouse:set(mouseX,mouseY)
	mouse = mouse -  center

	mouse = mouse * 0.5
end

----------------------------------------------------
function draw()
	of.background(64,128,255)
	of.translate(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2,0)
	of.noFill()
	of.setLineWidth(2)
	of.setColor(32, 0, 255)
	of.drawLine(0,0,mouse.x,mouse.y)
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
