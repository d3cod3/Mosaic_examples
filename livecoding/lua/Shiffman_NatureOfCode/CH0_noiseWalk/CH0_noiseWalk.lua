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
--	Shiffman_NatureOfCode/CH0_noiseWalk.lua
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

walkers = {}
noiseTimeX = {}
noiseTimeY = {}
stepX = {}
stepY = {}

numW = 300

----------------------------------------------------
function setup()
	for i=1,numW do
		walkers[i] = {}
		walkers[i].x = OUTPUT_WIDTH/2
		walkers[i].y = OUTPUT_HEIGHT/2
		noiseTimeX[i] = of.random(0,10000)
		noiseTimeY[i] = of.random(7000,14000)
		stepX[i] = of.random(0.001,0.003)
		stepY[i] = of.random(0.001,0.003)
	end
end

----------------------------------------------------
function update()
	for i=1,numW do
		mapX = of.map(of.noise(noiseTimeX[i]),0.15,0.85,0,OUTPUT_WIDTH,true)
		mapY = of.map(of.noise(noiseTimeY[i]),0.15,0.85,0,OUTPUT_HEIGHT,true)

		walkers[i].x = mapX
		walkers[i].y = mapY

		noiseTimeX[i] = noiseTimeX[i] + stepX[i]
		noiseTimeY[i] = noiseTimeY[i] + stepY[i]
	end
end

----------------------------------------------------
function draw()
	of.background(64,128,255)

	of.noFill()
	for i=1,numW do
		if math.fmod(i,7) == 0 then
			of.setColor(8,0,64)
		else
			of.setColor(64,128,255)
		end
		of.drawRectangle(walkers[i].x,walkers[i].y,6,6)
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
