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
--	NoiseMap.lua
--
--	Basic use of noise generator.
--	created by mj
--  translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

v = 0.0
inc= 0.01
----------------------------------------------------
function setup()
	of.enableSmoothing()
	of.setCircleResolution(40)
end

----------------------------------------------------
function update()
	v = v + inc
end

----------------------------------------------------
function draw()
	--of.background(0)

	of.setColor(0,0,0,6)
	of.drawRectangle(0,0,OUTPUT_WIDTH,OUTPUT_HEIGHT)

	of.setColor(255)
	x = of.map(of.noise(v),0.15,0.85,0,OUTPUT_WIDTH, false)
	y= (OUTPUT_HEIGHT/2) + of.random(-4,4)
	of.drawCircle(x,y,16,16)

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
