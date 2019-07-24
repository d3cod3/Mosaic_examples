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
-- LoadImage.lua
--
--  This show how to load image files from disk.
--
--  created by n3m3da | www.d3cod3.org
--  translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0


img = of.Image()
----------------------------------------------------
function setup()
	img:load(SCRIPT_PATH.."/data/highlands.jpg")
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)
	-- center & scale to fit OUTPUT
	w = OUTPUT_WIDTH
	h = (w/img:getWidth())*img:getHeight()
	posX = 0
	posY = (OUTPUT_HEIGHT-h)/2
	-- draw the image
	of.setColor(255)
	img:draw(posX,posY,w,h)
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
