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
--	SpiralHD.lua
--
-- This example show how to draw a spiral with high detail.
--
-- created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

----------------------------------------------------
function setup()

end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.setColor(255)
	of.setLineWidth(2)
	of.pushMatrix()
	of.translate(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2,0)
	spiral(0,0,5,13)
	of.popMatrix()
end

----------------------------------------------------
function spiral(rx,ry,volta,r)
	x = 0
	y = 0
	p = 0
	q = 0
	for d=0,of.PI*volta*2,0.1 do
		x = rx+(math.sin(d)*d)*r
		y = ry+(math.sin(d+(of.PI/2))*(d+(of.PI/8)))*r
		if d > 0.1 then
			of.drawLine(x,y,p,q)
		end
		p = x
		q = y
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
