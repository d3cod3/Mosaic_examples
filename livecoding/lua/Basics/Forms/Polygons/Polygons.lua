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
--	Polygons.lua
--
--	Concentric colored polygons
--
--	created by mj
--  translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

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

	of.noFill()
	of.setLineWidth(10)

	of.setColor(255,0,0)
	of.setCircleResolution(3)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 100)

	of.setColor(255,255,0)
	of.setCircleResolution(4)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 140)

	of.setColor(85,255,0)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 150)

	of.setCircleResolution(5)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 180)
	of.setColor(0,255,255)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 190)

	of.setCircleResolution(6)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 220)
	of.setColor(0,170,255)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 230)

	of.setCircleResolution(7)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 260)
	of.setColor(0,85,255)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 270)

	of.setCircleResolution(8)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 300)
	of.setColor(170,0,255)
	of.drawCircle (OUTPUT_WIDTH/2, OUTPUT_HEIGHT/2, 310)
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
