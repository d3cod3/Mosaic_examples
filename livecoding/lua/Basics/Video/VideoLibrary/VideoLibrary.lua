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
--	videoLibrary.lua: This example shows how to load a bunch of
--	video files from a specific directory.

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

dir = of.Directory()
videos = {}
currentVideo = 0
numVideos = 0

----------------------------------- MY VARS

----------------------------------------------------

-- main methods

----------------------------------------------------
function setup()

	------------------------------------------------ MY CODE

	-- add here your setup code
	dir:listDir(SCRIPT_PATH .. "/arcade/")
	dir:sort()
	numVideos = dir:size()

	currentVideo = math.floor(of.random(0,numVideos))

	if dir:size() > 0 then
		for i=0,numVideos-1 do
			videos[i] = of.VideoPlayer()
			videos[i]:load(dir:getPath(i))
			video[i]:setLoopState(of.LOOP_NORMAL)
			if i == currentVideo then
				videos[i]:play()
			else
				videos[i]:stop()
			end    
		end
	end
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

	-- only update the current video
    for i=0,numVideos-1 do
		if i == currentVideo and videos[i]:isPlaying() then
			videos[i]:update()
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
	mosaicBackground(0,0,0,255)

	-- add here your draw code
	of.setColor(255,255,255)
	scaleH = (OUTPUT_WIDTH/videos[currentVideo]:getWidth())*videos[currentVideo]:getHeight()
	videos[currentVideo]:draw(0,OUTPUT_HEIGHT/2 - scaleH/2,OUTPUT_WIDTH,scaleH)

    text = string.format("File: %s | Position: %f", dir:getName(currentVideo),videos[currentVideo]:getPosition())
    of.drawBitmapString(text,10,OUTPUT_HEIGHT-30)
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
    -- change video
	currentVideo = math.floor(of.random(0,numVideos))
	
	for i=0,numVideos-1 do
		if i == currentVideo then
			videos[i]:firstFrame()
			videos[i]:play()
		else
			videos[i]:stop()
			videos[i]:firstFrame()
		end
	end
end

----------------------------------------------------
function mouseScrolled(x,y)

end


----------------------------------------------------

-- MY custom methods

-- add here your custom methods if needed
