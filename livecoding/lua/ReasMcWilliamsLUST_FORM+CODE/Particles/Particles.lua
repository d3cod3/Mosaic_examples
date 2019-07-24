--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2018 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--  freedoms to use Mosaic in any context: commercial or non-commercial,
--  public or private, open or closed source.
--
--  See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
-- Particles.lua
--
-- Simulate: Particles
-- from Form+Code in Design, Art, and Architecture
-- by Casey Reas, Chandler McWilliams, and LUST
-- Princeton Architectural Press, 2010
--
-- http://formandcode.com
--
-- created by n3m3da | www.d3cod3.org
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

require("Particle")

-- variables for mouse interaction  (DO NOT DELETE)
mouseX = 0
mouseY = 0
----------------------------------------------------
particles = {}
numParticles = 500
saving = false
vec = 0

function setup()
  vec = of.Vec2f(100,OUTPUT_HEIGHT-100)
  of.enableSmoothing()

  for i=0, numParticles-1 do
    particles[i] = Particle(vec)
  end
end

----------------------------------------------------
function update()
  for i=0, numParticles-1 do
    particles[i]:update()
  end

end

----------------------------------------------------
function draw()
  of.background(0)
  for i=0, numParticles-1 do
    particles[i]:draw()
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
