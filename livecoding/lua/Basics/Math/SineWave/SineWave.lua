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
-- 	SineWave.lua
--  Sinusoidal wave drawing
--
--  created by mj
--  translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
-------------------------------------------------------
_angle = 0.0
pos = 0	-- position Y
amplitud = 40.0    -- height of the wave
inc = of.PI/30.0   -- increment od the angle

----------------------------------------------------
function setup()
	pos = OUTPUT_HEIGHT/2
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.setColor(255)
	for x = 0, OUTPUT_WIDTH, 5 do
		y = pos + (math.sin(_angle) *amplitud)

		of.drawRectangle(x, y, 2, 4)
		_angle = _angle + inc
	end
	_angle = 0.0

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
