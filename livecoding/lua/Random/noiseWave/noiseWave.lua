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
--	noiseWave.lua: A noise points controlled wave

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

noiseTime = {}
step = {}
verticalNoise = {}

numPoints = 30
circleDiam = OUTPUT_WIDTH/numPoints

----------------------------------- MY VARS

----------------------------------------------------

-- main methods

----------------------------------------------------
function setup()

	------------------------------------------------ MY CODE

	for i=0,numPoints-1 do
		noiseTime[i] = of.random(10000)
		step[i] = of.random(0.01,0.003)
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

	for i=0,numPoints-1 do
		verticalNoise[i] = of.map(of.noise(noiseTime[i]),0.15,0.95,-OUTPUT_HEIGHT/5,OUTPUT_HEIGHT/5,true)
		
		noiseTime[i] = noiseTime[i] + step[i]
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
	mosaicBackground(255,255,255,15)

	of.setColor(0,0,0,133)
     
     for i=0,numPoints-1 do
     	if i>0 then
     		of.drawLine(circleDiam*(i-1),OUTPUT_HEIGHT/2 + verticalNoise[i-1],circleDiam*i,OUTPUT_HEIGHT/2 + verticalNoise[i])
     	end
     	of.drawCircle(circleDiam*i,OUTPUT_HEIGHT/2 + verticalNoise[i],2)
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

-- MY custom methods-- add here your custom methods if needed