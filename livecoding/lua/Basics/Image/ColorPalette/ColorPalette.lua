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
--  ColorPalette.lua
--
--  This example shows how to generate a color palette from an image file.
--
--  created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
----------------------------------------------------

paleta = of.Image()
pixels = of.Pixels()
colores = {}
counter = 0
----------------------------------------------------
function setup()
	of.setCircleResolution(50)

	paleta:load(SCRIPT_PATH.."/data/duchamp.gif")
	pixels = paleta:getPixels()

	creaPaleta()
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.setColor(255,255,255)
	paleta:draw(0,0)

	of.drawBitmapString(string.format("Colors extracted: %i",counter),200,200)

	for p=0,counter-1 do
		of.setColor(colores[p].r,colores[p].g,colores[p].b)
		radio = OUTPUT_WIDTH/counter/2
		x = radio + (OUTPUT_WIDTH/counter)*p
		y = OUTPUT_HEIGHT/2
		of.drawCircle(x,y,radio)
	end
end
----------------------------------------------------
function creaPaleta()
	for x=0,paleta:getWidth()-1 do
		for y=0,paleta:getHeight()-1 do
			color = of.Color()
			color = pixels:getColor(x,y)
			existe = false

			if counter > 0 then
				for i=0,counter-1 do
					if colores[i].r == color.r and  colores[i].g == color.g and colores[i].b == color.b then
						existe = true
						break
					end
				end
			end

			if existe == false then
				colores[counter] = of.Color()
				colores[counter] = color
				counter = counter + 1
			end
		end
	end
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

end

function mouseScrolled(x,y)

end
