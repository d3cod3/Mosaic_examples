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
--	audioCombinedData.lua: A simple example to show how to pass audio analysis data ( as every other kind of data )
-- 												 to a lua script object from a Mosaic patch ( via the lua script first inlet )
--												 Mosaic green cable --> vector<float>


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

-- in this example ( examples/visualProgramming/AudioAnalysis/audioAnalaysisToLuaScript )
-- we are receiving the data in the following order:

-- [1] --> beat
-- [2] --> bpm
-- [3] --> rms
-- [4] --> pitch
-- [5] --> inharmonicity
-- [6 - 6 + 513(FFT data size)] --> FFT

beatIndex 		= 1
bpmIndex 			= 2
rmsIndex 			= 3
pitchIndex		= 4
inharmIndex		= 5
startFFTindex	= 6
FFTSize 			= 513	-- (FFT size is extracted from bufferSize, in Mosaic bufferSize is fixed at 1024, fftsize = bufferSize/2 + 1)

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
	mosaicBackground(0,0,0,10)

	-- add here your draw code

	-- draw something from audio analysis data

	-- The table indexes for data are not fixed, it depends on how you combine the vector data inside
	-- your Mosaic patch, using the "floats to vector" and "vector concat" objects

	-- in this example ( examples/visualProgramming/AudioAnalysis/audioAnalaysisToLuaScript )
	-- we are receiving the data in the following order:
	--
	-- [1] --> beat
	-- [2] --> bpm
	-- [3] --> rms
	-- [4] --> pitch
	-- [5] --> inharmonicity
	-- [6 - 6 + 513(FFT data size)] --> FFT

	-- beat detection
	if mosaic_data_inlet_size > beatIndex then
		of.setColor(255,255,255)
		of.drawRectangle(0,OUTPUT_HEIGHT/2,_mosaic_data_inlet[beatIndex]*OUTPUT_WIDTH,_mosaic_data_inlet[beatIndex]*10)
		of.setColor(255,255,255,240)
		of.drawRectangle(0,0,_mosaic_data_inlet[beatIndex]*OUTPUT_WIDTH,_mosaic_data_inlet[beatIndex]*OUTPUT_HEIGHT)
	end

	-- BPM
	if tableSize > bpmIndex then
		of.setColor(127)
		for i=0,math.floor(_mosaic_data_inlet[bpmIndex]) do
			of.pushMatrix()
			of.rotateYRad(of.random(of.PI))
			of.drawRectangle(OUTPUT_WIDTH/_mosaic_data_inlet[bpmIndex]*i,OUTPUT_HEIGHT/2,1,10)
			of.popMatrix()
		end
	end

	-- rms (volume)
	if tableSize > rmsIndex then
		correctedRMS = math.abs(_mosaic_data_inlet[rmsIndex]-0.5) * 2
		of.noFill()
		of.drawRectangle(0,OUTPUT_HEIGHT/3,correctedRMS*OUTPUT_WIDTH,OUTPUT_HEIGHT/3)
		of.drawRectangle(OUTPUT_WIDTH,OUTPUT_HEIGHT/3,-correctedRMS*OUTPUT_WIDTH,OUTPUT_HEIGHT/3)
	end

	-- pitch
	if tableSize > pitchIndex then
		normalizedPitch = _mosaic_data_inlet[pitchIndex]/4186 -- pitch detection range from "audio analyzer" object is 0-4186 Hz
		of.setColor(127,64,64)
		of.noFill()
		of.drawRectangle(0,OUTPUT_HEIGHT/3,normalizedPitch*OUTPUT_WIDTH,OUTPUT_HEIGHT/3)
		of.drawRectangle(OUTPUT_WIDTH,OUTPUT_HEIGHT/3,-normalizedPitch*OUTPUT_WIDTH,OUTPUT_HEIGHT/3)
	end

	-- inharmonicity
	if tableSize > inharmIndex then
		of.setColor(64,64,127)
		of.noFill()
		of.drawRectangle(0,OUTPUT_HEIGHT/3,_mosaic_data_inlet[inharmIndex]*OUTPUT_WIDTH,OUTPUT_HEIGHT/3)
	end

	-- FFT
	if tableSize > startFFTindex+FFTSize-1 then
		of.noFill()
		of.setColor(127)
		for i=0,FFTSize-1 do
			of.pushMatrix()
			of.translate(OUTPUT_WIDTH/2,0,0)
			of.drawRectangle(-OUTPUT_WIDTH*4*_mosaic_data_inlet[startFFTindex+i]/2,0,OUTPUT_WIDTH*4*_mosaic_data_inlet[startFFTindex+i],OUTPUT_HEIGHT/3.01)
			of.drawRectangle(-OUTPUT_WIDTH*3*_mosaic_data_inlet[startFFTindex+i]/2,OUTPUT_HEIGHT,OUTPUT_WIDTH*3*_mosaic_data_inlet[startFFTindex+i],-OUTPUT_HEIGHT/3.02)
			of.popMatrix()
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
