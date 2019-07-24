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
--	Mouse.lua
--
--	This example shows a basic use of mouseReleased & mouseMoved interaction.
--	created by mj
--  translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

xScreen = 0
yScreen = 0
fluctua = 20
dispersa = 5
----------------------------------------------------
function setup()
	xScreen = OUTPUT_WIDTH/2
	yScreen = OUTPUT_HEIGHT/2
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.setColor(255)

	text = "Click to change the circle position and move to modify it"
	of.drawBitmapString(text,20,200)

	for i = 0, fluctua do
		_angle = of.random(of.TWO_PI)
		dispX = xScreen + math.cos(_angle)*dispersa
		dispY = yScreen + math.sin(_angle)*dispersa
		of.drawCircle(dispX, dispY, 2)
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
	xScreen = x * 0.23566  --mouseX = x
	yScreen = y * 0.23566  --mouseY = y
end

function mouseDragged(x,y)
	mouseX = x
	mouseY = y
end

function mouseReleased(x,y)
	xScreen = x
	yScreen = y
end

function mouseScrolled(x,y)

end
