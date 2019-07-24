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
--  FontLoader.lua
--
-- This is a basic example use of the of.trueTypeFont class, used to load .ttf
-- or .otf fonts form the disk and using it to draw text.
--
-- created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
-----------------------------

font = of.TrueTypeFont()
text = "If the television screen is going to watch you, rewire it."
author = "Philip K. Dick"

----------------------------------------------------
function setup()
	-- path_to_font, size, anti-aliased, full character set
  font:load(SCRIPT_PATH.."/data/Anonymous_Pro_B.ttf",18, true, false)
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.pushMatrix()
  	of.translate(160,OUTPUT_HEIGHT/2,0)
  	of.setColor(255)
  	font:drawString(text, 0, 0)
  	of.setColor(35,125,0)
  	font:drawString(author, 540, 50)
  of.popMatrix()
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
