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
--	3dWebcam.lua: This example emulate a depth image from 2D cam pixels,
--	Something like Radiohead - House of cards videoclip (beginner version).

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

grabber = of.VideoGrabber()
pixels = of.Pixels()
c = of.Color()

captureW = 320
captureH = captureW/16 * 9

depth = 1.23
step = 5

----------------------------------- MY VARS

----------------------------------------------------

-- main methods

----------------------------------------------------
function setup()

	------------------------------------------------ MY CODE

	grabber:setDeviceID(0)
	grabber:setup(captureW,captureH)

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

	grabber:update()
	if grabber:isFrameNew() then
		pixels = grabber:getPixels()
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
	mosaicBackground(0,0,0,50)

	
	of.pushMatrix()

	-- mirror webcam horizontally
	of.translate(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2,0.0)
	of.rotateXRad(of.degToRad(-OUTPUT_HEIGHT/2) + 0.3)
	of.rotateYRad(0.6)
	of.translate(-OUTPUT_WIDTH/2,-OUTPUT_HEIGHT/2,0.0)

	-- fill the output window
	of.scale(OUTPUT_WIDTH/captureW,OUTPUT_HEIGHT/captureH,1.0)

	
	of.enableAlphaBlending()
	of.noFill()
	for y=0, captureH-step, step do
		of.beginShape()
		for x=0, captureW-2, 2 do
			c = pixels:getColor(x,y)
			of.setColor(15,c:getBrightness() * depth,15,210)
			--of.setColor(c)
			of.vertex(x,y,-c:getBrightness() * depth)
        end
		of.endShape()
	end
	of.disableAlphaBlending()

	of.popMatrix()
	------------------------------------------------ MY CODE


end

----------------------------------------------------
function exit()
	grabber:close()
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
