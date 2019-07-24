--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2019 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License. This gives everyone the
--    freedoms to use Mosaic in any context: commercial or non-commercial,
--    public or private, open or closed source.
--
--    See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--	UrlLoader.lua: This example show how to load content from a url file.
--
-- created by n3m3da | www.d3cod3.org
--
--


-- variables for mouse interaction
mouseX = 0
mouseY = 0


response = of.HttpResponse()
buffer = of.Buffer()

----------------------------------------------------
function setup()
	response = of.loadURL("http://www.d3cod3.org")
	buffer = response.data

end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.setColor(245,245,245)
	of.drawBitmapString(tostring(buffer:getText()),20,20)

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
