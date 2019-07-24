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
-- EmbeddedIteration.lua
--
--  Repeat: Embedded Iteration
--  from Form+Code in Design, Art, and Architecture
--  by Casey Reas, Chandler McWilliams, and LUST
--  Princeton Architectural Press, 2010
--
--  http://formandcode.com
--
-- created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")
option = 1
----------------------------------------------------
function setup()
	of.enableSmoothing()
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.setColor(245,151,176)

	if option==1 then
		-- stitches
		for x=50, OUTPUT_WIDTH-50, 20 do
			for y=50, OUTPUT_HEIGHT-50, 20 do
				of.drawLine(x-5,y-5,x+5,y+5)
				of.drawLine(x+5,y-5,x-5,y+5)
			end
		end
	elseif option==2 then
		-- perspective
		for x=50, OUTPUT_WIDTH-50, 20 do
			for y=50, OUTPUT_HEIGHT-50, 20 do
				of.drawLine(x,y,OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2)
			end
		end
	elseif option==3 then
		-- overlapping circles
		of.noFill()
		for x=50, OUTPUT_WIDTH-50, 20 do
			for y=50, OUTPUT_HEIGHT-50, 20 do
				of.drawEllipse(x,y,40,40)
			end
		end
	elseif option==4 then
		-- rotating arcs
		for x=50, OUTPUT_WIDTH-50, 20 do
			for y=50, OUTPUT_HEIGHT-50, 20 do
				of.drawLine(x-5,y-5,x+5,y+5)
			end
		end
	elseif option==5 then
		-- groups of five
		for x=50, OUTPUT_WIDTH-50, 20 do
			for y=50, OUTPUT_HEIGHT-50, 20 do
				for i=1, 16, 4 do
					of.drawLine(x+i,y,x+i,y+12)
				end
				of.drawLine(x,y,x+12,y+12)
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
	if option >= 5 then
		option = 1
	else
		option = option + 1
	end
end

function mouseScrolled(x,y)

end
