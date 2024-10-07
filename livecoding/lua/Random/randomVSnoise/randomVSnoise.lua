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
--	randomVSnoise.lua: Random vs noise

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

noiseTime = of.random(0,10000)
step = of.random(0.001,0.003)

lineAlpha = {}

----------------------------------- MY VARS

----------------------------------------------------

-- main methods

----------------------------------------------------
function setup()

	------------------------------------------------ MY CODE

	makeNoise()

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
	if mosaic_data_inlet_size > 0 then
		
		if _mosaic_data_inlet[1] == 1.0 then
			makeRandom()
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

	for i=0,OUTPUT_WIDTH-1 do
        of.setColor(255,255,255,lineAlpha[i])
        of.drawLine(i,0,i,OUTPUT_HEIGHT)
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
    if key == string.byte('r') then
        makeRandom()
    elseif key == string.byte('n') then
        makeNoise()
    end
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

function makeNoise()
	for i=0,OUTPUT_WIDTH-1 do
		lineAlpha[i] = of.map(of.noise(noiseTime),0.15,0.95,0,255,true)
		
		noiseTime = noiseTime + step
	end
end

function makeRandom()
	for i=0,OUTPUT_WIDTH-1 do
		lineAlpha[i] = of.random(255)
	end
end