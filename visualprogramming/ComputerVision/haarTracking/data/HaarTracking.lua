--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2020 Emanuele Mazza aka n3m3da
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
--	HaarTracking.lua: Receive and visualize ( in a funny way ) Haar Tracking data ( using frontal face ) from Mosaic


-- -------------------- IMPORTANT -------------------------------------------------------------------------
--  _mosaic_data_inlet is the name of the lua table storing data incoming from a Mosaic patch
--  a vector<float> is automatically converted to a lua table, where the index starts from 1, NOT 0 !!!!
--  so the first position of your table will be accessed like this: _mosaic_data_inlet[1]
-- -------------------- IMPORTANT -------------------------------------------------------------------------

----------------------------------- MOSAIC VARS (DO NOT TOUCH)

-- variables for mouse interaction
mouseX = 0
mouseY = 0

-- variable for storing _mosaic_data_inlet size
mosaic_data_inlet_size = 0
----------------------------------- MOSAIC VARS (DO NOT TOUCH)

----------------------------------- MY VARS

-- in this example ( examples/visualProgramming/ComputerVision/haarTracking )
-- we are receiving the data in the following order:

-- blobs vector from "haar tracking" Mosaic object is constructed as follows:
--
--
-- [1] -> number of active haar blobs
-- [2] -> blob ID									---> accessible as _mosaic_data_inlet[2 + 8*N] for N blobs
-- [3] -> blob age (milliseconds)
-- [4] -> blob center X
-- [5] -> blob center Y
-- [6] -> blob bounding rect X		---> accessible as _mosaic_data_inlet[6 + 8*N] for N blobs
-- [7] -> blob bounding rect Y
-- [8] -> blob bounding rect Width
-- [9] -> blob bounding rect Height
--

numBlobs = 0
teletubbyFace = of.Image()

----------------------------------- MY VARS

----------------------------------------------------

-- main methods

----------------------------------------------------
function setup()

	------------------------------------------------ MY CODE

	-- add here your setup code
	teletubbyFace:load(SCRIPT_PATH .. "/teletubby.png")

	------------------------------------------------ MY CODE

end

----------------------------------------------------
function update()

	------------------------------------------------ MOSAIC CODE
	mosaic_data_inlet_size = getMosaicDataInletSize()
	------------------------------------------------ MOSAIC CODE

	------------------------------------------------ MY CODE

	-- add here your update code

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

	----------------------------------------- Drawing blobs

	-- in this example ( examples/visualProgramming/ComputerVision/haarTracking )
	-- we are receiving the data in the following order:

	-- blobs vector from "haar tracking" Mosaic object is constructed as follows:
	--
	--
	-- [1] -> number of active haar blobs
	-- [2] -> blob ID									---> accessible as _mosaic_data_inlet[2 + 8*N] for N blobs
	-- [3] -> blob age (milliseconds)
	-- [4] -> blob center X
	-- [5] -> blob center Y
	-- [6] -> blob bounding rect X		---> accessible as _mosaic_data_inlet[6 + 8*N] for N blobs
	-- [7] -> blob bounding rect Y
	-- [8] -> blob bounding rect Width
	-- [9] -> blob bounding rect Height

	of.setLineWidth(3)
	of.noFill()

	numBlobs = _mosaic_data_inlet[1]

	for j=0, numBlobs-1 do
		x = _mosaic_data_inlet[6 + 8*j]
		y = _mosaic_data_inlet[7 + 8*j]
		w = _mosaic_data_inlet[8 + 8*j]
		h = _mosaic_data_inlet[9 + 8*j]

		center = of.Vec2f(_mosaic_data_inlet[4 + 8*j],_mosaic_data_inlet[5 + 8*j])

		of.setColor(255)
		of.drawBitmapString(string.format("%s:%s",_mosaic_data_inlet[2 + 8*j],_mosaic_data_inlet[3 + 8*j]),x,y-6)

		teletubbyFace:draw(x,y,w,h)
	end

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
