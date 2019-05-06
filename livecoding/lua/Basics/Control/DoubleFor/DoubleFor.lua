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
--	DoubleFor.lua: A Basic Lua script example of control structure with double for, for Mosaic,
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

showCircles = false

----------------------------------------------------
function setup()

end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)
	lado_w = OUTPUT_WIDTH/8 -- Local variable of the draw block
	lado_h = OUTPUT_HEIGHT/4


	for i = 0, OUTPUT_WIDTH/lado_w do
		for j = 0, OUTPUT_HEIGHT/lado_h do
			of.setColor(255)
			of.noFill()
			of.drawRectangle(i*lado_w, j*lado_h, lado_w, lado_h)
			-- The double for generates a grid of rectangles in two dimensions
			of.drawBitmapString(string.format("i: %i",i),i*lado_w + 20,j*lado_h + 30)
			of.drawBitmapString(string.format("j: %i",j),i*lado_w + 20,j*lado_h + 50)
			-- the text indicates the i ang j value in the grid

			if showCircles then
				of.fill()
				of.setColor(i*20,100,j*20)
				of.drawCircle(i*lado_w + lado_w/2,j*lado_h + lado_h/2,20 + (i*j) )
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
	if key == string.byte('c') then
		showCircles = not showCircles
	end
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
