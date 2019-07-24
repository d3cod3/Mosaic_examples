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
-- 	Bouncing.lua
--
--  A basic example of gravity simulation with the simplest math.
--
--  created by n3m3da | www.d3cod3.org
--  translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
---------------------------------------------------
particles = {}
numParticles = 300

----------------------------------------------------
function setup()
	of.setCircleResolution(50)
	resetScene()
end

----------------------------------------------------
function update()
	for i=0, numParticles do
		particles[i].x = particles[i].x + particles[i].vx
		particles[i].y = particles[i].y + particles[i].vy
		particles[i].vy = particles[i].vy + particles[i].gy

		-- bottom
		if particles[i].y >= OUTPUT_HEIGHT then
			particles[i].vy = particles[i].vy * -0.9
			-- top
		elseif particles[i].y <= 0 then
			particles[i].vy = particles[i].vy * -0.8
		end
		-- right
		if particles[i].x >= OUTPUT_WIDTH then
			particles[i].vx = particles[i].vx * -0.9
			-- left
		elseif particles[i].x < 0 then
			particles[i].vx = particles[i].vx * -0.9
		end
	end
end

----------------------------------------------------
function draw()
	of.background(0)

	for i=0, numParticles do
		if of.getElapsedTimeMillis() - particles[i].birth < particles[i].life then
			of.setColor(particles[i].red,163,particles[i].blue,80)
			of.drawCircle(particles[i].x, particles[i].y, particles[i].diam)
		end
	end
end
---------------------------------------------------
function resetScene()
	for i=0, numParticles do
		particles[i] = {}
		particles[i].birth = of.getElapsedTimeMillis()
		particles[i].life = of.random(1000,10000)
		particles[i].x = of.random(OUTPUT_WIDTH)
		particles[i].y = of.random(OUTPUT_HEIGHT/5)
		particles[i].vx = 0
		particles[i].vy = 0
		particles[i].diam = of.random(1,70)
		particles[i].gy = particles[i].diam*of.random(0.001,0.01)
		particles[i].red = of.random(57,160)
		particles[i].blue = particles[i].diam*of.random(2,10)
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
	resetScene()
end

function mouseScrolled(x,y)

end
