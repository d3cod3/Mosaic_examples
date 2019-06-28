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
--	Superformula.lua
--
--  Visualize: Superformula
--  from Form+Code in Design, Art, and Architecture
--  by Casey Reas, Chandler McWilliams, and LUST
--  Princeton Architectural Press, 2010
--
--  http://formandcode.com
--
--  created by n3m3da | www.d3cod3.org
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0


scaler = 300
m = 2
n1 = 18
n2 = 1
n3 = 1
pointNum = 180
holePoints = {}
----------------------------------------------------
function setup()
	of.enableSmoothing()
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.noFill()
	of.setLineWidth(1)
	of.setColor(245,151,176)
	of.pushMatrix()
	of.translate(OUTPUT_WIDTH/3,OUTPUT_HEIGHT/2,0)
	of.rotateZDeg(of.getElapsedTimef())
	newscaler = scaler
	for s=0, 16 do
		of.beginShape()

		mm = m + s
		nn1 = n1 + s
		nn2 = n2 + s
		nn3 = n3 + s
		newscaler = newscaler * 0.98
		sscaler = newscaler

		holePoints = superFormula(mm, nn1, nn2, nn3)
		of.curveVertex(holePoints[pointNum-1].x*sscaler,holePoints[pointNum-1].y*sscaler)
		for j=0, pointNum do
			of.curveVertex(holePoints[j].x*sscaler,holePoints[j].y*sscaler)
		end
		of.curveVertex(holePoints[0].x*sscaler,holePoints[0].y*sscaler)
		of.endShape(false)
	end
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

function sfPoint(m, n1, n2, n3, phi)

	point = {}
	point.x = 0
	point.y = 0

	a = 1
	b = 1

	t1 = math.cos(m * phi / 4) / a
	t1 = math.abs(t1)
	t1 = t1^n2 --math.pow(t1,n2)

	t2 = math.sin(m * phi / 4) / b
	t2 = math.abs(t2)
	t2 = t2^n3 --math.pow(t2,n3)

	r = (t1+t2)^(1/n1) --math.pow(t1+t2,1/n1)

	if math.abs(r) == 0 then
		point.x = 0
		point.y = 0
	else
		r = 1 / r
		point.x = r * math.cos(phi)
		point.y = r * math.sin(phi)
	end

	return point
end

function superFormula(m, n1, n2, n3)

	points = {}
	numPoints = pointNum
	phi = (math.pi*2) / numPoints

	for i=0, numPoints do
		points[i] = sfPoint(m, n1, n2, n3, phi*i)
	end

	return points

end
