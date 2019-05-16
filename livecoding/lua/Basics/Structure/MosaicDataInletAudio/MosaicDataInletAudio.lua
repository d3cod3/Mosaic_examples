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
--	BasicStructure.lua: A basic Lua example to show system variables,
--  comments (like this one), _mosaic_data_inlet, and custom functions, for Mosaic,
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

-- _mosaic_data_inlet is the name of the lua table storing data incoming from a Mosaic patch
-- a vector<float> is automatically converted to a lua table, where the index starts from 1, NOT 0
-- so the first position of your table will be accessed like this: _mosaic_data_table[1]

-- in this example the order of tha data table is:
-- [1] --> beat
-- [2] --> rms (volume)
-- [3] --> pitch

beatIndex 		= 1
rmsIndex 		= 2
pitchIndex 		= 3

tableSize = 0

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")

font = of.TrueTypeFont()    -- the variable is linked to the openFrameworks class ofTrueTypeFont()

----------------------------------------------------
function setup()
	font:load(SCRIPT_PATH .. "/data/Anonymous_Pro_B.ttf", 24)
							-- load font file from data folder
end

----------------------------------------------------
function update()
	----------------------------------------- RECEIVING vector<float> from MOSAIC PATCH
	-- avoid null readings Custom Function
	avoidNullReadings()

end

----------------------------------------------------
function draw()
	of.background(0)

	----------------------------------------- RECEIVING vector<float> from MOSAIC PATCH
	-- avoid null readings
	avoidNullReadings()

	-- get _mosaic_data_table size
	tableSize = 0
	for k,v in pairs(_mosaic_data_inlet) do
		tableSize = tableSize + 1
	end
	-----------------------------------------
	-- rms detection (volume)
	if tableSize > rmsIndex then
		of.setColor(255)
		of.drawRectangle(0, 0, OUTPUT_WIDTH, OUTPUT_HEIGHT/2 - _mosaic_data_inlet[rmsIndex]*80)
							-- OUTPUT_WIDTH and OUTPUT_HEIGHT are the system variables
							-- for output window width and height
		of.setColor(0)
		text = string.format("_mosaic_data_inlet is receiving the volume value: %f", _mosaic_data_inlet[rmsIndex])
		font:drawString(text, 100, OUTPUT_HEIGHT/4)
	end
	-- pitch detection
	if tableSize > pitchIndex then
		of.setColor(0, 0, 0, 20)
		of.drawRectangle(0, OUTPUT_HEIGHT/2, OUTPUT_WIDTH, OUTPUT_HEIGHT/2)
		of.setColor(255)
		text = string.format("_mosaic_data_inlet is receiving the pitch value: %f", _mosaic_data_inlet[pitchIndex])
		font:drawString(text, 100, (OUTPUT_HEIGHT/4)*3)
	end
	-- beat detection
	if tableSize > beatIndex then
		of.setColor(255,255,255, 180)
		of.drawRectangle(0,OUTPUT_HEIGHT/2,_mosaic_data_inlet[beatIndex]*OUTPUT_WIDTH,_mosaic_data_inlet[beatIndex]*10)
		--of.setColor(255,255,255,240)
		of.drawRectangle(0, 0, _mosaic_data_inlet[beatIndex]*OUTPUT_WIDTH, _mosaic_data_inlet[beatIndex]*OUTPUT_HEIGHT)
	end


end

----------------------------------------------------
function exit()

end

----------------------------------------------------
-- Custom function
function avoidNullReadings()
	----------------------------------------- RECEIVING vector<float> from MOSAIC PATCH
	-- avoid null readings
	if next(_mosaic_data_inlet) == nil then
		return
	end
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

end

function mouseScrolled(x,y)

end
