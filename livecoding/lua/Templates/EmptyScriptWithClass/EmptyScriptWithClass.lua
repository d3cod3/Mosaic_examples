--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2019 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License.
--	This gives everyone the freedoms to use Mosaic in any context:
--	commercial or non-commercial, public or private,
--	open or closed source.
--
--  See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--  EmptyScriptWithClass.lua: A Basic Lua template script
--  using a custom class for Mosaic, mimicking the standard
--  OF app structure


---------------------------------- MOSAIC SPECIFIC CODING INFO

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")

---------------------------------- MOSAIC SPECIFIC CODING INFO

-- import required class
-- (IMPORTANT, you'll need the ClassTemplate.lua in the same folder!!!)
require("ClassTemplate")

----------------------------------- MOSAIC VARS (DO NOT TOUCH)
mouseX = 0
mouseY = 0
----------------------------------- MOSAIC VARS (DO NOT TOUCH)

----------------------------------- MY VARS

classObject = ClassTemplate(100)

----------------------------------- MY VARS

----------------------------------------------------

-- main methods

----------------------------------------------------
function setup()

	------------------------------------------------ MY CODE

	-- add here your setup code

	------------------------------------------------ MY CODE

end

----------------------------------------------------
function update()

	------------------------------------------------ MY CODE

	-- add here your update code
  classObject:update()
	------------------------------------------------ MY CODE

end

----------------------------------------------------
function draw()

	------------------------------------------------ MY CODE

	-- draw background first
	mosaicBackground(0,0,0,255)

	-- add here your draw code
  classObject:draw()
	------------------------------------------------ MY CODE


end

----------------------------------------------------
function exit()

end


-- input callbacks

----------------------------------------------------
function keyPressed(key)

end

----------------------------------------------------
function keyReleased(key)

end

----------------------------------------------------
function mouseMoved(x,y)
	mouseX = x
	mouseY = y
end

----------------------------------------------------
function mouseDragged(x,y)
	mouseX = x
	mouseY = y
end

----------------------------------------------------
function mouseReleased(x,y)

end

----------------------------------------------------
function mouseScrolled(x,y)

end

----------------------------------------------------

-- MOSAIC custom methods

function mosaicBackground(r,g,b,a)
	of.setColor(r,g,b,a)
	of.drawRectangle(0,0,OUTPUT_WIDTH,OUTPUT_HEIGHT)
end

----------------------------------------------------

-- MY custom methods

-- add here your custom methods if needed
