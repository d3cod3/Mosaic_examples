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
-- 	Wave.lua
--
-- 	Parameterize: Wave
-- 	from Form+Code in Design, Art, and Architecture
-- 	by Casey Reas, Chandler McWilliams, and LUST
-- 	Princeton Architectural Press, 2010
--
-- 	http://formandcode.com
--
--
-- created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
-------------------------------------------------
brickW = 40
brickH = 15
cols = 20
rows = 24
cOffset = 60
rOffset = 30
phaseInc = 0.15
r = 0.0
----------------------------------------------------
function setup()
	r = of.random(-math.pi/4, math.pi/4)
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)
	of.noFill()
	of.setColor(245,151,176)
	of.translate(30,30,0)
	for i=0, cols do
		of.pushMatrix()
		of.translate(i*cOffset,0,0)
		dir = 1
		for j=0, rows do
			of.pushMatrix()
			of.translate(0,rOffset*j,0)
			of.rotateZDeg(of.radToDeg(r))
			of.drawRectangle(-brickW/2,-brickH/2,brickW,brickH)
			of.popMatrix()
			r = r + ((dir+0.0001)*phaseInc)
			if r >= of.HALF_PI/2.0 or r <= -(of.HALF_PI/2.0) then
				dir = dir * -1
			end
		end
		of.popMatrix()
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
