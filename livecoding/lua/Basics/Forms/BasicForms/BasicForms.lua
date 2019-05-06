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
--	BasicsForms.lua: A Basic Lua script example for draw basics forms for Mosaic
--	mimicking the standard OF app structure
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")

modul = 0

----------------------------------------------------
function setup()
	of.enableAntiAliasing()
	modul = OUTPUT_HEIGHT/18
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)	
	of.setLineWidth(2)
	-------------------- Point, a circle whit radio = 1
	x = OUTPUT_WIDTH/8
	y = OUTPUT_HEIGHT/4
	radio = 1
	of.setColor(255)
	of.drawCircle(x,y, radio)
	of.drawBitmapString("Point: a circle whit radio = 1 ", 20, (OUTPUT_HEIGHT/2)-modul)
	of.drawBitmapString("of.drawCircle(x,y, radio)", 20, (OUTPUT_HEIGHT/2)-(modul/2))

	-------------------- Line
	x1 = (OUTPUT_WIDTH/4)+ modul
	y1 = (OUTPUT_HEIGHT/2)-(modul*2)
	x2 = (OUTPUT_WIDTH/2)- modul
	y2 = modul
	of.drawLine(x1, y1, x2, y2)
	of.drawBitmapString("Line ", OUTPUT_WIDTH/4 +20, (OUTPUT_HEIGHT/2)-modul)
	of.drawBitmapString("of.drawLine(x1, y1, x2, y2)", OUTPUT_WIDTH/4 +(modul/2), (OUTPUT_HEIGHT/2)-(modul/2))

	-------------------- Triangle
	x1 = OUTPUT_WIDTH/2 + modul
	y1 = (OUTPUT_HEIGHT/2)-(modul*2)
	x2 = (OUTPUT_WIDTH/8)*5
	y2 = modul*2
	x3 = ((OUTPUT_WIDTH/4)*3)-modul
	y3 = (OUTPUT_HEIGHT/2)-(modul*2)
	of.setColor(200)
	of.drawTriangle(x1, y1, x2, y2, x3, y3)
	of.setColor(255)
	of.drawBitmapString("Triangle ", OUTPUT_WIDTH/2 + 10, (OUTPUT_HEIGHT/2)-modul)
	of.drawBitmapString("of.drawTriangle(x1, y1, x2, y2, x3, y3)", OUTPUT_WIDTH/2 + 5, (OUTPUT_HEIGHT/2)-(modul/2))

	-------------------- Square
	x = (OUTPUT_WIDTH/4)*3 +80
	y = 100
	w = OUTPUT_WIDTH/4-160
	h = OUTPUT_WIDTH/4-160
	of.setColor(200)
	of.drawRectangle(x, y, w, h)
	of.setColor(255)
	of.drawBitmapString("Square ", (OUTPUT_WIDTH/4)*3 +10, (OUTPUT_HEIGHT/2)-40)
	of.drawBitmapString("of.drawRectangle(x, y, width, height)", (OUTPUT_WIDTH/4)*3 +10, (OUTPUT_HEIGHT/2)-20)

	-------------------- Rectangle
	x = 40
	y = OUTPUT_HEIGHT/2 + 100
	w = OUTPUT_WIDTH/4 - 80
	h = OUTPUT_HEIGHT/2 - 200
	of.setColor(200)
	of.drawRectangle(x, y, w, h)
	of.setColor(255)
	of.drawBitmapString("Rectangle ", 10, OUTPUT_HEIGHT- 40)
	of.drawBitmapString("of.drawRectangle(x, y, width, height)", 10, OUTPUT_HEIGHT-20)

	-------------------- Circle
	x = (OUTPUT_WIDTH/8)*3
	y = (OUTPUT_HEIGHT/4)*3
	radio = (OUTPUT_WIDTH/8) - 60
	of.setColor(200)
	of.setCircleResolution(120)
	of.drawCircle(x, y, radio)
	of.setColor(255)
	of.drawBitmapString("Circle ", OUTPUT_WIDTH/4 + 10, OUTPUT_HEIGHT- 40)
	of.drawBitmapString("of.drawCircle(x, y, radio)", OUTPUT_WIDTH/4 + 10, OUTPUT_HEIGHT-20)
	-------------------- Ellipse

	x = (OUTPUT_WIDTH/8)*5
	y = (OUTPUT_HEIGHT/4)*3
	w = (OUTPUT_WIDTH/4) - 80
	h = OUTPUT_HEIGHT/4
	of.setColor(200)
	of.drawEllipse(x, y, w, h)
	of.setColor(255)
	of.drawBitmapString("Ellipse ", OUTPUT_WIDTH/2 + 10, OUTPUT_HEIGHT- 40)
	of.drawBitmapString("of.drawEllipse(x, y, w, h)", OUTPUT_WIDTH/2 + 10, OUTPUT_HEIGHT-20)


	-------------------- Regular polygon -- a circle whose resolution is the number of polygon sides
	x = (OUTPUT_WIDTH/8)*7
	y = (OUTPUT_HEIGHT/4)*3
	radio = (OUTPUT_WIDTH/8) - 60
	of.setCircleResolution(5) -- 5 for pentagon
	of.setColor(200)
	of.drawCircle(x, y, radio)
	of.setColor(255)
	of.drawBitmapString("Regular polygon: like circle but with ",(OUTPUT_WIDTH/8)*6 + 5, OUTPUT_HEIGHT- 40)
	of.drawBitmapString("of.setCircleResolution(5), 5= pentagon", (OUTPUT_WIDTH/8)*6 + 5, OUTPUT_HEIGHT-20)


	---------------- grid
	of.setColor(100)
	of.setLineWidth(1)
	of.drawLine(OUTPUT_WIDTH/2, 0,OUTPUT_WIDTH/2, OUTPUT_HEIGHT)
	of.drawLine(OUTPUT_WIDTH/4, 0,OUTPUT_WIDTH/4, OUTPUT_HEIGHT)
	of.drawLine((OUTPUT_WIDTH/4)*3, 0,(OUTPUT_WIDTH/4)*3, OUTPUT_HEIGHT)
	of.drawLine(0,OUTPUT_HEIGHT/2, OUTPUT_WIDTH, OUTPUT_HEIGHT/2)
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
