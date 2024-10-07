--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2024 Emanuele Mazza aka n3m3da
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
--  vinyl.lua: A Basic Lua template script

---------------------------------- MOSAIC SPECIFIC CODING INFO

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")

---------------------------------- MOSAIC SPECIFIC CODING INFO

-- import required class
-- (IMPORTANT, you'll need the ClassTemplate.lua in the same folder!!!)
require("Ring")

----------------------------------- MOSAIC VARS (DO NOT TOUCH)
mouseX = 0
mouseY = 0
-- variable for storing _mosaic_data_inlet size
mosaic_data_inlet_size = 0
----------------------------------- MOSAIC VARS (DO NOT TOUCH)

----------------------------------- MY VARS

newRing = Ring(0,0,200)
blackRing = Ring(0,0,200)

----------------------------------- MY VARS

----------------------------------------------------

-- main methods

----------------------------------------------------
function setup()

	------------------------------------------------ MY CODE

	of.setCircleResolution(50)

	newRing:setup()
	blackRing:setup()

	------------------------------------------------ MY CODE

end

----------------------------------------------------
function update()

	------------------------------------------------ MOSAIC CODE
	mosaic_data_inlet_size = getMosaicDataInletSize()

	-- send data to _mosaic_data_outlet if needed
	-- we are using here just the first position of the table
	-- but you can expand it with numerical data as you need it
	_mosaic_data_outlet[1] = of.random(10)
	------------------------------------------------ MOSAIC CODE

	------------------------------------------------ MY CODE

    newRing:changeColor(225,220,220,of.random(5))
	blackRing:changeColor(0,0,0,of.random(5))

	if mosaic_data_inlet_size > 0 then
		newRing:setDiameterMultiplier(_mosaic_data_inlet[1]*6)
		blackRing:setDiameterMultiplier(_mosaic_data_inlet[1]*6)
	end
	
	------------------------------------------------ MY CODE

end

----------------------------------------------------
function draw()

	------------------------------------------------ MOSAIC CODE
	checkMosaicDataInlet()
	------------------------------------------------ MOSAIC CODE

	------------------------------------------------ MY CODE

	-- draw background first
	mosaicBackground(255,255,255,0.1)
    
	of.pushMatrix()

	of.translate(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2,0)
	of.rotateZDeg(of.getElapsedTimeMillis()/6)
	
    newRing:draw()
	blackRing:draw()

	of.popMatrix()
    ------------------------------------------------ MY CODE


end

----------------------------------------------------
function exit()

end

----------------------------------------------------

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
-- MY custom methods-- add here your custom methods if needed