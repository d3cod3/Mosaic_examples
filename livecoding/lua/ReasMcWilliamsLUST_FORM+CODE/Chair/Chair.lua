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
--  Chair.lua
--
--  Parameterize: Chair
--  from Form+Code in Design, Art, and Architecture
--  by Casey Reas, Chandler McWilliams, and LUST
--  Princeton Architectural Press, 2010
--
--  http://formandcode.com
--
-- created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
----------------------------
chairSeatHeight      = 100
chairWidth           = 90
chairDepth           = 90
chairBackHeight      = 100
chairFrameThickness  = 10
----------------------------------------------------
function setup()
	of.enableSmoothing()
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)
	of.setColor(245,151,176)
	of.drawBitmapString("Click to random-change chair dimensions",200,200)

	of.pushMatrix()
	of.translate(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2,0)
	of.rotateXDeg(of.radToDeg(-of.PI/9))
	of.rotateYDeg(of.radToDeg(of.PI/8))
	of.setLineWidth(3)
	drawChair()
	of.popMatrix()

end
---------------------------------------------------
function drawChair()
	-- back
	of.pushMatrix()
	of.translate(chairWidth/2, chairBackHeight/2,0)
	drawBox(chairWidth, chairBackHeight, chairFrameThickness)
	of.popMatrix()

	-- seat
	of.pushMatrix()
	of.translate(chairWidth/2, chairBackHeight + chairFrameThickness/2, chairDepth/2 - chairFrameThickness/2)
	drawBox(chairWidth, chairFrameThickness, chairDepth)
	of.popMatrix()


	-- legs
	of.pushMatrix()
	of.translate(chairFrameThickness/2, chairBackHeight + chairSeatHeight/2 + chairFrameThickness, 0)
	drawBox(chairFrameThickness, chairSeatHeight, chairFrameThickness)
	of.popMatrix()

	of.pushMatrix()
	of.translate(chairWidth - chairFrameThickness/2, chairBackHeight + chairSeatHeight/2 + chairFrameThickness, 0)
	drawBox(chairFrameThickness, chairSeatHeight, chairFrameThickness)
	of.popMatrix()

	of.pushMatrix()
	of.translate(chairWidth - chairFrameThickness/2, chairBackHeight + chairSeatHeight/2 + chairFrameThickness, chairDepth - chairFrameThickness)
	drawBox(chairFrameThickness, chairSeatHeight, chairFrameThickness)
	of.popMatrix()

	of.pushMatrix()
	of.translate(chairFrameThickness/2, chairBackHeight + chairSeatHeight/2 + chairFrameThickness, chairDepth - chairFrameThickness)
	drawBox(chairFrameThickness, chairSeatHeight, chairFrameThickness)
	of.popMatrix()
end

function drawBox(w,h,d)
	local x1 = -w/2.0
	local x2 = w/2.0
	local y1 = -h/2.0
	local y2 = h/2.0
	local z1 = -d/2.0
	local z2 = d/2.0

	of.beginShape()

	-- front
	--	glNormal3d(0, 0, 1)
	of.vertex(x1, y1, z1)
	of.vertex(x2, y1, z1)
	of.vertex(x2, y2, z1)
	of.vertex(x1, y2, z1)

	-- right
	--	glNormal3d(1, 0, 0)
	of.vertex(x2, y1, z1)
	of.vertex(x2, y1, z2)
	of.vertex(x2, y2, z2)
	of.vertex(x2, y2, z1)

	-- back
	--	glNormal3d(0, 0, -1);
	of.vertex(x2, y1, z2)
	of.vertex(x1, y1, z2)
	of.vertex(x1, y2, z2)
	of.vertex(x2, y2, z2)

	-- left
	--	glNormal3d(-1, 0, 0)
	of.vertex(x1, y1, z2)
	of.vertex(x1, y1, z1)
	of.vertex(x1, y2, z1)
	of.vertex(x1, y2, z2)

	-- top
	--	glNormal3d(0, 1, 0)
	of.vertex(x1, y1, z2)
	of.vertex(x2, y1, z2)
	of.vertex(x2, y1, z1)
	of.vertex(x1, y1, z1)

	-- bottom
	--	glNormal3d(0, -1, 0)
	of.vertex(x1, y2, z1)
	of.vertex(x2, y2, z1)
	of.vertex(x2, y2, z2)
	of.vertex(x1, y2, z2)

	of.endShape();

end

function scrambleChair()
	chairSeatHeight = math.floor(of.random(30, 200))
	chairWidth      = math.floor(of.random(30, 200))
	chairDepth      = math.floor(of.random(30, 200))
	chairBackHeight = math.floor(of.random(30, 200))
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
	scrambleChair()
end

function mouseScrolled(x,y)

end
