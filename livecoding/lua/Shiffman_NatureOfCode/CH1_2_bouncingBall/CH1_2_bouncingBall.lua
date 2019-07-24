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
--	Shiffman_NatureOfCode/CH1_2_bouncingBall.lua
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

location = of.Vec3f(100,100,0)
velocity = of.Vec3f(2.5,5,0)

----------------------------------------------------
function setup()

end

----------------------------------------------------
function update()
	location = location + velocity

	if location.x > OUTPUT_WIDTH or location.x < 0 then
		velocity.x = velocity.x * -1
	end

	if location.y > OUTPUT_HEIGHT or location.y < 0 then
		velocity.y = velocity.y * -1
	end
end

----------------------------------------------------
function draw()
	of.background(64,128,255)
	of.setColor(32, 0, 255)
	of.drawCircle(location.x,location.y,16)
	of.noFill()
	of.setColor(8,0,64)
	of.drawCircle(location.x,location.y,16)

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
