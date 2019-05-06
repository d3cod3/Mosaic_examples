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
--	Conditional.lua: A Basic Lua script example of conditional control structure, for Mosaic,
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")

-- declare global variables
posx = 0
posy = 0
velx = 6
vely = 20
radio = 50

----------------------------------------------------
function setup()
	-- initial position
	posx = OUTPUT_WIDTH/2
	posy = OUTPUT_HEIGHT/2

end

----------------------------------------------------
function update()
	posx = posx+velx -- Movement-> position + speed
	posy = posy+vely

	-- Movement control. Detects the circle collision
	-- with the output window edges, considering the radius value
	if posx-radio < 0 or posx+radio > OUTPUT_WIDTH then
		velx = velx * -1  -- Inverts movement direction
	end

	if posy-radio < 0 or posy+radio > OUTPUT_HEIGHT then
		vely = vely * -1
	end
end

----------------------------------------------------
function draw()
	--of.background(0) -- Background canceled
	of.setColor(0, 0,0, 20)
	of.drawRectangle(0, 0, OUTPUT_WIDTH, OUTPUT_HEIGHT)
	-- It work like a transparent black background

	of.setColor(255)
	of.drawCircle(posx, posy, radio)
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
