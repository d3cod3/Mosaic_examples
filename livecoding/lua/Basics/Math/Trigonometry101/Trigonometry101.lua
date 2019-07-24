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
--	Trigonometry101.lua
--
--  First of a series of examples about trigonometry.
--
--  created by n3m3da | www.d3cod3.org
--  translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
--------------------------------------------------
theta = 0  --angle

circleX = 0  -- x position
circleY = 0  -- y position

rad = 170 --RADIUS

----------------------------------------------------
function setup()
	circleX = OUTPUT_WIDTH/2
	circleY = OUTPUT_HEIGHT/2
end

----------------------------------------------------
function update()
	diffx = mouseX - circleX
	diffy = mouseY - circleY

	_length = math.sqrt(diffx^2 + diffy^2)

	theta = math.atan(diffy,diffx)
end

----------------------------------------------------
function draw()
	of.background(0)

	of.setColor(0)
  of.drawCircle(circleX,circleY,3)

  posX = circleX + rad * math.cos(theta)
  posY = circleY + rad * math.sin(theta)

  of.setColor(255,0,255)
  of.drawCircle(posX, posY,6)

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
