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
--	Shiffman_NatureOfCode/CH0_BellCurve.lua
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

heights = {}
e = 2.71828183
m = 0
----------------------------------------------------
function setup()
	for i=1,OUTPUT_WIDTH do
		heights[i] = 0
	end
end

----------------------------------------------------
function update()
	-- standard deviation based on mouseX
	sd = of.map(mouseX,0,OUTPUT_WIDTH,0.4,2,true)
	for i=0,OUTPUT_WIDTH do
		xcoord = of.map(i,0,OUTPUT_WIDTH,-3,3,true)
		--  square root of 2 * of.PI
		sqPi = math.sqrt(of.TWO_PI)
		--  -(x - mu)^2
		xmsq = -1*(xcoord-m)*(xcoord-m)
		-- variance (standard deviation squared)
		sdsq = sd*sd
		--  P(x) function
			--heights[i] = (1 / (sd*sqPi)) * (math.pow(e,xmsq/sdsq))
			heights[i] = (1 / (sd*sqPi)) * (e^xmsq/sdsq)
		end
	end

	----------------------------------------------------
	function draw()
		of.background(64,128,255)
		of.noFill()
		of.setColor(8,0,64)

		of.beginShape()
		for i=1, OUTPUT_WIDTH do
			xx = i
			yy = of.map(heights[i],0,1,OUTPUT_HEIGHT-20,20,true)
			of.vertex(xx,yy)
		end
		of.endShape(false)
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
