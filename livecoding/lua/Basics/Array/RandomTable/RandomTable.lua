--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2018 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--  freedoms to use Mosaic in any context: commercial or non-commercial,
--  public or private, open or closed source.
--
--  See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--	RandomTable.lua: An example of basic Lua script for a table and a custom function, for Mosaic,
--	mimicking the standard OF app structure
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")

scriptPath = SCRIPT_PATH
-------------------------
randomTable = {}	-- declare the table
side = 40
rows = 0
cols = 0
numElements = 0

----------------------------------------------------
function setup()
	rows = math.floor(OUTPUT_HEIGHT/side) -- calculate number of rows
	cols = math.floor(OUTPUT_WIDTH/side)  -- and number of columns
	numElements = rows * cols -- length of the randomTable table

	resetTable() -- run the custom function that assigns values to the table
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)
	pos = 0
	-- with the double for, a grid of rectangles is generated in the output window
	for i=0,cols-1 do
		for j=0,rows-1 do
			x = side*i
			y = side*j
			of.setColor(randomTable[pos]) -- the color is assigned with the values of randomTable
			of.drawRectangle(x,y,side,side)
			pos = pos + 1 -- generates the linear index for randomTable in the double for
		end
	end
end

----------------------------------------------------

function resetTable()
	-- initialize and assign values to the table
	for i=0,numElements-1 do
		if of.randomuf() < 0.5 then
			randomTable[i] = 0
		else
			randomTable[i] = 255
		end
		-- of.log(of.LOG_NOTICE,randomTable[i]) -- you can delete the comment signs to see the table values in the Logger
	end											-- before, activate Logger in the Mosaic System menu
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
	resetTable() -- with the mouse action, run again custom function, generating new values in the table
				 -- Connect the red cable between Lua Script and Output Window objects
end

function mouseScrolled(x,y)

end
