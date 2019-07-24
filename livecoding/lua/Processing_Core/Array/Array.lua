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

-- Mosaic port to Processing examples [http://www.processing.org]
--
-- Array.
--
-- An array is a list of data. Each piece of data in an array
-- is identified by an index number representing its position in
-- the array. Arrays are zero based, which means that the first
-- element in the array is [0], the second element is [1], and so on.
-- In this example, an array named "coswav" is created and
-- filled with the cosine values. This data is displayed three
-- separate ways on the screen.
--
--
-- Note that lua uses 1-based arrays
--
--
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
----------------------
coswave = {}

----------------------------------------------------
function setup()
	for i=0,OUTPUT_WIDTH-1 do
		amount = of.map(i,0,OUTPUT_WIDTH,0,of.PI,true)
		coswave[i] = math.abs(math.cos(amount))
	end
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)
	of.noFill()

	y1 = 0
	y2 = OUTPUT_HEIGHT/3
	for i=0,OUTPUT_WIDTH-1,4 do
		of.setColor(coswave[i]*255)
		of.drawLine(i,y1,i,y2)
	end

	y1 = y2
	y2 = y1+y1
	for i=0,OUTPUT_WIDTH-1,4 do
		of.setColor(coswave[i]*255 / 4)
		of.drawLine(i,y1,i,y2)
	end

	y1 = y2
	y2 = OUTPUT_HEIGHT
	for i=0,OUTPUT_WIDTH-1,4 do
		of.setColor(255 - coswave[i]*255)
		of.drawLine(i,y1,i,y2)
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
