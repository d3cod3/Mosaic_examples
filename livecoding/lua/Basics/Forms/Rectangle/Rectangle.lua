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
--	Rectangle.lua
--
-- This example show how to use the of.rectangle() class.
--
-- created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
--------------------------
rect1 = of.Rectangle()
rect2 = of.Rectangle()


----------------------------------------------------
function setup()
	rect1:set(400,400,200,200)
	rect2:setFromCenter(400,400,200,200)
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	-- draw rect1
	of.setColor(255,255,0)
	of.fill()
	of.drawRectangle(rect1.x,rect1.y,rect1.width,rect1.height)
	-- draw rect2
	of.setColor(255,0,0)
	of.noFill()
	of.setLineWidth(3)
	of.drawRectangle(rect2.x,rect2.y,rect2.width,rect2.height)
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
