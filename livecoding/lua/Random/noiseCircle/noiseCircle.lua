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
--	noiseCircle.lua: Random vs noise

---------------------------------- MOSAIC SPECIFIC CODING INFO

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")

---------------------------------- MOSAIC SPECIFIC CODING INFO


----------------------------------- MOSAIC VARS (DO NOT TOUCH)

-- variables for mouse interaction
mouseX = 0
mouseY = 0

-- variable for storing _mosaic_data_inlet size
mosaic_data_inlet_size = 0
----------------------------------- MOSAIC VARS (DO NOT TOUCH)

----------------------------------- MY VARS

noiseTime = 0
noiseStep = 0.003

alphaNoise = 0

----------------------------------- MY VARS

----------------------------------------------------

-- main methods

----------------------------------------------------
function setup()

	------------------------------------------------ MY CODE

	of.setCircleResolution(50)

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

	alphaNoise = of.map( of.noise(noiseTime) ,0.15,0.85  ,0,255,  true)
	
	noiseTime = noiseTime + noiseStep
	
	if mosaic_data_inlet_size > 0 then
		noiseStep = _mosaic_data_inlet[1]
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
	mosaicBackground(0,0,0,255)

	-- circulo random
    of.setColor(255,255,255,of.random(255))
    of.drawCircle(OUTPUT_WIDTH/4,OUTPUT_HEIGHT/2,200)
     
    -- circulo noise
    of.setColor(255,255,255,alphaNoise)
    of.drawCircle(OUTPUT_WIDTH*3/4,OUTPUT_HEIGHT/2,200)

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

-- MY custom methods

-- add here your custom methods if needed