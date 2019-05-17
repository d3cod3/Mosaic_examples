--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2018 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--    freedoms to use Mosaic in any context: commercial or non-commercial,
--    public or private, open or closed source.
--
--    See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--	ColorHsb.lua: A Lua script example for HSB model color in Mosaic,
--
--


-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")
-------------------------------------------------

c = of.Color()	--  openFrameworks color class
heightModul = 0	--  horizontal configuration module

----------------------------------------------------

function setup()
	heightModul = OUTPUT_HEIGHT/255   	-- OUTPUT_WIDTH = width of the output window
	-- Mosaic does not recognize the system variables OUTPUT_WIDTH and OUTPUT_HEIGHT before it reads the setup
end
----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	j = 1  -- local variable to modulate hsb color
	for i = 0, 255 do
		c:setHsb(j,255,255) -- j modulates the hue
		of.setColor(c.r,c.g,c.b) -- Take the values of setHsb
		of.drawRectangle(0, heightModul*i, OUTPUT_WIDTH, heightModul)
		j = j+1  -- in each loop, j add 1 its value
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
