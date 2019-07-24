--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2019 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--  freedoms to use Mosaic in any context: commercial or non-commercial,
--  public or private, open or closed source.
--
--  See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
-- 	Blending_Modes.lua
--
-- 	This example show how to apply different blendmodes to the graphics scene.
--
--	 Original example from openFrameworks:
-- 	<of_folder/examples/graphics/blendingExample/>
--
-- 	created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

blendMode = of.BLENDMODE_ALPHA
rainbow = of.Image()
alpha = 0.0
counter = 0.0
font = of.TrueTypeFont()
eventString = "Alpha"
timeString = ""
fondo = of.Image()
----------------------------------------------------
function setup()
	font:load(SCRIPT_PATH.."/data/Anonymous_Pro_B.ttf",22,true,false)

	rainbow:allocate(256,256,of.IMAGE_COLOR_ALPHA)
	rainbow:load(SCRIPT_PATH.."/data/rainbow.tiff")
	fondo:load(SCRIPT_PATH.."/data/highlands.jpg")
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	-- center & scale to fit OUTPUT
	w = OUTPUT_WIDTH
	h = (w/fondo:getWidth())*fondo:getHeight()
	posX = 0
	posY = (OUTPUT_HEIGHT-h)/2
	-- draw the image
	of.setColor(255)
	fondo:draw(posX,posY,w,h)

	timeString = "Press 1 - 5 to switch blend modes"

	of.enableBlendMode(of.BLENDMODE_ALPHA)

	of.setColor(0,0,102)
	font:drawString(eventString, 98,198)

	of.setColor(51,51,255)
	font:drawString(eventString,100,200)

	of.setColor(0,0,102)
	font:drawString(timeString,98,98)

	of.setColor(51,51,255)
	font:drawString(timeString,100,100)

	of.setColor(255,255,255,255)
	of.enableBlendMode(blendMode)

	rainbow:draw(mouseX - rainbow:getWidth()/2,mouseY - rainbow:getHeight()/2)
	of.disableBlendMode()
end

----------------------------------------------------
function exit()

end


-- input callbacks

----------------------------------------------------
function keyPressed(key)

end

function keyReleased(key)
	if key == string.byte('1') then
		blendMode = of.BLENDMODE_ALPHA
		eventString = "Alpha"
	elseif key == string.byte('2') then
		blendMode = of.BLENDMODE_ADD
		eventString = "Add"
	elseif key == string.byte('3') then
		blendMode = of.BLENDMODE_MULTIPLY
		eventString = "Multiply"
	elseif key == string.byte('4') then
		blendMode = of.BLENDMODE_SUBTRACT
		eventString = "Subtract"
	elseif key == string.byte('5') then
		blendMode = of.BLENDMODE_SCREEN
		eventString = "Screen"
	end
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
