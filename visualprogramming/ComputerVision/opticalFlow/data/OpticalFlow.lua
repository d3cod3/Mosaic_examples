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
--	OpticalFlow.lua: Receive and visualize Optical Flow data from Mosaic

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

-- in this example ( examples/visualProgramming/ComputerVision/opticalFlow )
-- we are receiving the data in the following order:

-- flow data vector from "optical flow" Mosaic object is constructed as follows:
--
--
-- [1] -> motion detection
-- [2] -> number of rows of flow matrix
-- [3] -> number of cols of flow matrix
-- [4 - 3 + ()(cols*rows / 10) * 4)] -> flow lines


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
	mosaicBackground(200*_mosaic_data_inlet[1],0,0,20)

	-- add here your draw code
	----------------------------------------- Drawing optical flow

	-- in this example ( examples/visualProgramming/ComputerVision/opticalFlow )
	-- we are receiving the data in the following order:

	-- flow data vector from "optical flow" Mosaic object is constructed as follows:
	--
	--
	-- [1] -> motion detection
	-- [2] -> number of rows of flow matrix
	-- [3] -> number of cols of flow matrix
	-- [4 - 3 + ()(cols*rows / 10) * 4)] -> flow lines

	of.setLineWidth(4)
	of.fill()
	of.setColor(255)

	rows = _mosaic_data_inlet[2]
	cols = _mosaic_data_inlet[3]

	flowSize = (rows*cols)/10 * 4

	of.pushMatrix()
	of.scale(OUTPUT_WIDTH/320,OUTPUT_WIDTH/240,1.0)

	for j=0, flowSize-1, 4 do
		x1 = _mosaic_data_inlet[4+j]
		y1 = _mosaic_data_inlet[4+j+1]
		x2 = _mosaic_data_inlet[4+j+2]
		y2 = _mosaic_data_inlet[4+j+3]
		if x1 and x2 and y1 and y2 then
			of.drawLine(x1,y1,x2,y2)
		end
	end

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

-- MY custom methods

-- add here your custom methods if needed
