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
--	Shiffman_NatureOfCode/CH1_1_vectorHeading.lua
--
--	This example is one of the series of Mosaic adaptation to
--	Daniel Shiffman <Nature of Code> book examples.
--
--	More info: <http://natureofcode.com/>
--
--	created by n3m3da | www.d3cod3.org
--	translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

randomVector = of.Vec2f(of.randomuf(),of.randomuf())

ground = of.Vec2f(1,0)
mouse = of.Vec2f(0,0)
center = 0
centeredMouse = of.Vec2f(0,0)


----------------------------------------------------
function setup()
	center = of.Vec2f(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2)
end

----------------------------------------------------
function update()
	mouse:set(mouseX,mouseY)
end

----------------------------------------------------
function draw()
	of.background(64,128,255)

	drawVector(randomVector,center,200)

	centeredMouse = mouse-center
	drawVector(centeredMouse,center,1)

	phi = math.abs(centeredMouse:angle(randomVector))
	of.setColor(32, 0, 255)
	of.drawBitmapString(string.format("%f degrees\n %f radians",phi,of.degToRad(phi)),40,40)
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
	randomVector:set(of.randomf(),of.randomf())
end

function mouseScrolled(x,y)

end

--------------------------------------------------
function drawVector(v,loc,scayl)
	of.pushMatrix()
	arrowSize = 4
	of.translate(loc.x,loc.y,0)
	of.setColor(8,0,64)
	of.rotateRad(-v:angle(ground)) -- heading2D -->  -v:angle(ofVec2f(1,0))
	len = v:length()*scayl
	of.drawLine(0,0,len,0)
	of.drawLine(len,0,len-arrowSize,arrowSize/2)
	of.drawLine(len,0,len-arrowSize,-arrowSize/2)
	of.popMatrix()
end
