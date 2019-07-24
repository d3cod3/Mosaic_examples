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
--	HttpParseData.lua: 	This example show how to load content from a url file, and use regex to search and parse specific data.
--	In this example we search for urls.
--
--  created by n3m3da | www.d3cod3.org
--
--


-- variables for mouse interaction
mouseX = 0
mouseY = 0

searchTag = "openframeworks"
action_url = "https://twitter.com/search?src=typd&q=%23" .. searchTag

response = of.HttpResponse()
buffer = of.Buffer()

links = {}
lindex = 1

----------------------------------------------------
function setup()

end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)

	of.setColor(255)

	for i=1, lindex-1 do
	 of.drawBitmapString(links[i],20,20 + (20*i))
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
	if key == string.byte('l') then
		loadURL(action_url)
	end
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

-- custom methods

----------------------------------------------------
function loadURL(url)
	response = of.loadURL(url)
	buffer = response.data

	extractLinks(buffer:getText())
end

function extractLinks(textdata)
	-- reset table
	links = {}
	lindex = 1
	-- extract links with regex
	for u in string.gmatch(textdata, "https?:/+%/+[%a-z%0-9]+%.+[%a-z%0-9]+%.+[%a-z%d%/%:%.%;%?%&%ñ%-%_%=]+") do
		of.log(of.LOG_NOTICE, tostring(u))
		table.insert(links,lindex,tostring(u))
		lindex = lindex + 1
	end
end
