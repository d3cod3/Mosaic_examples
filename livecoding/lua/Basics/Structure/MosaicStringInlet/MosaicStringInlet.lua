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
--	MosaicStringInlet.lua: a simple demo using _mosaic_string_inlet
--	input cable from patch

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

-- add here your variables
palabra = ""
maxLetters = 12
longitudPalabra = 0
lastChar = ""
lastLastChar = ""

activaPalabra = false

hsvCol = of.Color()
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

	-- send data to _mosaic_data_outlet if needed
	-- we are using here just the first position of the table
	-- but you can expand it with numerical data as you need it
	--_mosaic_data_outlet[1] = of.random(10)
	------------------------------------------------ MOSAIC CODE

	------------------------------------------------ MY CODE


	-- limita la palabra a maxLetters caracteres
	if string.len(_mosaic_string_inlet) <= maxLetters then
		palabra = _mosaic_string_inlet
		lastChar = string.sub(palabra,string.len(palabra)-1)
		lastLastChar = string.sub(palabra,string.len(palabra)-2)
	else
		palabra = string.sub(_mosaic_string_inlet,0,maxLetters)
		lastChar = string.sub(palabra,string.len(palabra))
		lastLastChar = string.sub(palabra,string.len(palabra)-1)
	end

	longitudPalabra = string.len(palabra)-1

	-- ascii 32 es la tecla espacio
	if string.byte(lastChar) == 32 and string.len(palabra) > 1 and string.byte(lastLastChar) ~= 32 then
		activaPalabra = true
	else
		activaPalabra = false
	end
	
	-- debug
	if activaPalabra then
		of.log(of.LOG_NOTICE,tostring(palabra))
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

	hsvCol:setHsb(longitudPalabra/maxLetters*255,255,255)


	if activaPalabra then
		of.setColor(hsvCol.r,hsvCol.g,hsvCol.b)
	else
		of.setColor(0,0,0)
	end

	of.drawRectangle(OUTPUT_WIDTH/2-150,OUTPUT_HEIGHT/2-150,300,300)

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