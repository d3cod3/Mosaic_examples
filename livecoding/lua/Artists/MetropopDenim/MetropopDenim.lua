--
--
--	----------------------------------------------------------
--	  Mosaic | OF Visual Patching Developer Platform
--
--	  Copyright (c) 2019 Emanuele Mazza aka n3m3da
--
--	  Mosaic is distributed under the MIT License. This gives everyone the
--    freedoms to use Mosaic in any context: commercial or non-commercial,
--    public or private, open or closed source.
--
--    See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--	Artists/metropopDenim.lua:
--  This example is from Metropop Denim piece by Clayton Cubitt & Tom Carden.
--  http://processing.org/exhibition/works/metropop/

--  created by n3m3da | www.d3cod3.org
--
--

require("Attractor")
require("Particle")

-- variables for mouse interaction
mouseX = 0
mouseY = 0

NUM_PARTICLES = 2000
NUM_ATTRACTORS = 9

particles = {}
attractors = {}
scat = true

----------------------------------------------------
function setup()
	reset()
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()

	if scat then
		scat = false
    of.background(255)
	end

	of.setColor(0,0,0,3)
  of.noFill()

  for i=1,NUM_PARTICLES do
      particles[i]:step(NUM_ATTRACTORS)
			of.drawRectangle(particles[i].x,particles[i].y,1,1)
  end

end

----------------------------------------------------
function reset()
		scat = true
    for j=1,NUM_ATTRACTORS do
        attractors[j] = Attractor()
				attractors[j]:setup(of.random(OUTPUT_WIDTH),of.random(OUTPUT_HEIGHT))
    end

    for i=1,NUM_PARTICLES do
        particles[i] = Particle()
				particles[i]:setup(of.random(OUTPUT_WIDTH),of.random(OUTPUT_HEIGHT),attractors)
		end
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
	reset()
end

function mouseScrolled(x,y)

end
