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
--	Polyline.lua
--
--	Basic use of of.polyline class.
--
--	created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

lazo = of.Polyline()
smoothed = of.Polyline()

box = of.Rectangle()
----------------------------------------------------
function setup()
	for i=0,90 do
		lazo:addVertex(math.sin(of.degToRad(i))*OUTPUT_WIDTH,math.cos(i)*OUTPUT_HEIGHT/4,0)
	end

	smoothed = lazo:getSmoothed(9,0.3)
	box = lazo:getBoundingBox()
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.pushMatrix()
	of.translate(0,OUTPUT_HEIGHT/2,0)

	-- polyline
	of.setColor(255)
	of.setLineWidth(1)
	lazo:draw()

	-- smoothed polyline
	of.setColor(18,159,211)
	of.setLineWidth(2)
	smoothed:draw()

	-- bounding box
	of.setColor(255)
	of.noFill()
	of.drawRectangle(box.x,box.y,box.width,box.height)

	of.popMatrix()
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
