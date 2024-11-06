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
--	2dFilm.lua: This example shows how to create a 2d movie matrix from
--  camera frames.

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
currentPixels = of.Pixels()

frameCache = {}
frameCount = 0

originCamW = 1280/2
originCamH = 720/2

camW = originCamW/6
camH = originCamH/6

cols = math.floor(OUTPUT_WIDTH/camW)
rows = math.floor(OUTPUT_HEIGHT/camH)
maxFrames = cols*rows


----------------------------------- MY VARS

----------------------------------------------------

-- main methods

----------------------------------------------------
function setup()

	------------------------------------------------ MY CODE

	grabber:setDeviceID(0)
	grabber:setup(originCamW,originCamH)

	currentPixels:allocate(originCamW,originCamH,of.PIXELS_RGB)

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
		currentPixels = grabber:getPixels()
		frameCache[frameCount] = of.Image()
		frameCache[frameCount]:allocate(originCamW,originCamH,of.IMAGE_COLOR)
		frameCache[frameCount]:setFromPixels(currentPixels)
        frameCache[frameCount]:resize(camW,camH)
		
		if frameCount > maxFrames then
			frameCount = maxFrames
		else
			frameCount = frameCount + 1
		end
		
		if frameCount > 0 then
			for i=1,frameCount-1 do
				frameCache[i-1] = frameCache[i]
			end
		end
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

    of.setColor(255)

	c = 0
    r = 0
    for i,v in pairs(frameCache) do
    	
    	frameCache[i]:draw(c*camW,r*camH,camW,camH)
    		
    	c = c + 1
    	if c == cols then
    		c = 0
    		r = r + 1
    	end
    end
	
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
