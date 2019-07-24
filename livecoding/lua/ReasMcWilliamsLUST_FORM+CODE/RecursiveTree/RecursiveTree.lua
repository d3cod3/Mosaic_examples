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
-- 	RecursiveTree.lua
--
-- 	Repeat: Recursive Tree
-- 	from Form+Code in Design, Art, and Architecture
-- 	by Casey Reas, Chandler McWilliams, and LUST
-- 	Princeton Architectural Press, 2010
--
-- 	http://formandcode.com
--
-- 	This program is based on Context Free program
-- 	"Foggy Tree by Chris Coyne:
-- 	http://www.contextfreeart.org/gallery/view.php?id=4
--
-- 	created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
-----------------------------------------------------

dotSize = 9
startAngle = of.degToRad(270)
angleOffsetA = of.degToRad(1.5)
angleOffsetB = of.degToRad(50)
----------------------------------------------------
function setup()

end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.fill()
	of.setColor(245,151,176)
	of.translate(OUTPUT_WIDTH/2,OUTPUT_HEIGHT,0)
	seed1(dotSize,startAngle,0,0)
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
--------------------------------------------------------------
function seed1(_dSize,_angle,_x,_y)
	if _dSize > 1.0 then
		r = of.randomuf()
		-- 98% chance this will happen
		if r > 0.02 then
			of.drawEllipse(_x, _y, _dSize, _dSize)
			newx = _x + math.cos(_angle) * _dSize
			newy = _y + math.sin(_angle) * _dSize
			seed1(_dSize * 0.99, _angle - angleOffsetA, newx, newy)
			-- 2% chance this will happen
		else
			of.drawEllipse(_x, _y, _dSize, _dSize)
			newx = _x + math.cos(_angle)
			newy = _y + math.sin(_angle)
			seed2(_dSize * 0.99, _angle + angleOffsetA, newx, newy)
			seed1(_dSize * 0.60, _angle + angleOffsetB, newx, newy)
			seed2(_dSize * 0.50, _angle - angleOffsetB, newx, newy)
		end

	end
end

function seed2(_dSize,_angle,_x,_y)
	if _dSize > 1.0 then
		r = of.randomuf()
		-- 95% chance this will happen
		if r > 0.05 then
			of.drawEllipse(_x, _y, _dSize, _dSize)
			newx = _x + math.cos(_angle) * _dSize
			newy = _y + math.sin(_angle) * _dSize
			seed2(_dSize * 0.99, _angle + angleOffsetA, newx, newy)
			-- 5% chance this will happen
		else
			of.drawEllipse(_x, _y, _dSize, _dSize)
			newx = _x + math.cos(_angle)
			newy = _y + math.sin(_angle)
			seed1(_dSize * 0.99, _angle + angleOffsetA, newx, newy)
			seed2(_dSize * 0.60, _angle + angleOffsetB, newx, newy)
			seed1(_dSize * 0.50, _angle - angleOffsetB, newx, newy)
		end

	end
end
