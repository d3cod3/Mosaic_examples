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
--	PushPop.lua
--
-- Understanding of.pushMatrix() and of.popMatrix().
--
-- created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
-------------------------------------

ambient = of.FloatColor(1.0,1.0,1.0,1.0)
light = of.Light()

pos = {}
numTriangles = 60
----------------------------------------------------
function setup()
	of.setCircleResolution(3)
	for i=0, numTriangles do
		pos[i] = {}
		pos[i].x = of.random(0,OUTPUT_WIDTH)
		pos[i].y = of.random(0,OUTPUT_HEIGHT)
		pos[i].z = of.random(-200,200)
		pos[i].rotX = of.random(0,360)
		pos[i].velX = of.randomuf()
		pos[i].t = of.random(20,120)
	end
end

----------------------------------------------------
function update()
	for i=0, numTriangles do
		pos[i].rotX = pos[i].rotX + pos[i].velX
	end
end

----------------------------------------------------
function draw()
	of.background(0)
	light:enable()
	light:setSpotlight(of.map(mouseX,0,OUTPUT_HEIGHT,0,of.radToDeg(of.HALF_PI),true),0.1)
	light:setAmbientColor(ambient)

	for i=0, numTriangles do
		tri(pos[i].x,pos[i].y,pos[i].z,pos[i].rotX,pos[i].t)
	end

	light:disable()

end
----------------------
function tri(x,y,z,r,t)
	of.pushMatrix()

	of.translate(x,y,z)
	of.rotateXDeg(r)
	of.rotateYDeg(mouseX/OUTPUT_WIDTH * 360)
	of.rotateZDeg(of.getElapsedTimef())

	of.setColor(255)
	of.noFill()
	of.setLineWidth(3)
	of.drawCircle(0,0,t)

	of.drawAxis(60)

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
