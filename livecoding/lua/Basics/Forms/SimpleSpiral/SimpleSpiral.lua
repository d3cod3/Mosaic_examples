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
--	SimpleSpiral.lua
--
-- Simple spiral drawing
--
-- created by mj
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
--------------------
radio = 30
angulo = 0.0

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

	of.setColor(255)
	radio = 30
	for grado = 0, 360*4, 10 do
		angulo = math.rad(grado)
		x = OUTPUT_WIDTH/2 + (math.cos(angulo) * radio)
		y = OUTPUT_HEIGHT/2 + (math.sin(angulo) * radio)

		of.drawCircle(x, y, 4)
		radio = radio + 2
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
