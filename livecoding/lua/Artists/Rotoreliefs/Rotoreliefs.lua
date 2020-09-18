--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2020 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License.
--	This gives everyone the freedoms to use Mosaic in any context:
--	commercial or non-commercial, public or private,
--	open or closed source.
--
--  See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--	Rotoreliefs.lua: One of the rotating disk series by Marcel Duchamp, 1925.


radio = 15
spiralFactor = 15
numCircles = 23
radioMax = ((radio*(numCircles+1)) + (spiralFactor+1))
inc = 15
counter = 0

----------------------------------------------------
function setup()


end

----------------------------------------------------
function update()




end

----------------------------------------------------
function draw()

	checkMosaicDataInlet()


	-- draw background first
	mosaicBackground(0,0,0,255)

	of.setCircleResolution(80)

	of.setColor(255)
  of.noFill()
  of.setLineWidth(3)
	of.drawCircle(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2, radioMax) -- support circle
  radio = 15

  of.pushMatrix()

  of.translate(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2, 0.0)
  of.rotateZDeg(counter)


  for i = 0, numCircles do
  	angulo = i*of.TWO_PI/((numCircles/2) +1)
    x = (math.cos(angulo) * spiralFactor)
		y = (math.sin(angulo) * spiralFactor)
		of.drawCircle(x, y, radio)
		radio = radio + spiralFactor
	end

	of.popMatrix()
	counter = counter + 1

end
