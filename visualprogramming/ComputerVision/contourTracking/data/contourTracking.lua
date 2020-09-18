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
--	contourTracking.lua: Receive and visualize Contour Tracking data from Mosaic

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

-- in this example ( examples/visualProgramming/ComputerVision/contourTracking )
-- we are receiving the data in the following order:

-- contour vectors ( both contourData as convexHullData ) from "contour tracking" Mosaic object are constructed as follows:
--
--
-- [1] -> number of active blobs
-- [2] -> number of contour vertices
-- [3] -> blob ID
-- [4] -> blob age (milliseconds)
-- [5 - 5+(_mosaic_data_inlet[2] * 2)] -> blob contour vertices

numBlobs = 0

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
	----------------------------------------- Drawing contours

	-- in this example ( examples/visualProgramming/ComputerVision/contourTracking )
	-- we are receiving the data in the following order:

  -- contour vectors ( both contourData as convexHullData ) from "contour tracking" Mosaic object are constructed as follows:
	--
	--
	-- [1] -> number of active blobs
	-- [2] -> number of contour vertices
	-- [3] -> blob ID
	-- [4] -> blob age (milliseconds)
	-- [5 - 5+(_mosaic_data_inlet[2] * 2)] -> blob contour vertices

	of.setLineWidth(4)
	of.fill()
	of.setColor(255)

	numBlobs = _mosaic_data_inlet[1]

	nextIndex = 2
	for j=0, numBlobs-1 do

		numVertices = _mosaic_data_inlet[nextIndex]*2

		contour = of.Polyline()

		if numVertices then
			for i=0, numVertices-1, 2 do
				x = _mosaic_data_inlet[nextIndex+3+i]
				y = _mosaic_data_inlet[nextIndex+3+i+1]
				if x and y then
					contour:addVertex(x,y,0)
				end
			end

			contour:draw()

			nextIndex = nextIndex + numVertices + 3
		end

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
