--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2024 Emanuele Mazza aka n3m3da
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
--	LuaTablesTutorial.lua: a graphical tutorial about lua classes
-- ( and arrays in general )

---------------------------------- MOSAIC SPECIFIC CODING INFO

-- Mosaic system variable for loading external resources (files)
-- Example:
-- img = of.Image()
-- img:load(SCRIPT_PATH .. "/data/test.jpg")

---------------------------------- MOSAIC SPECIFIC CODING INFO

----------------------------------- MOSAIC VARS (DO NOT TOUCH)

-- variables for mouse interaction
mouseX = 0
mouseY = 0

-- variable for storing _mosaic_data_inlet size
mosaic_data_inlet_size = 0
----------------------------------- MOSAIC VARS (DO NOT TOUCH)

----------------------------------- MY VARS

-- An empty table (for now!)
myTable = {}
myTableLength = 0
theIndex = 1
navi = 0

-- Drawing
showStructure = false

----------------------------------- MY VARS

----------------------------------------------------

----------------------------------------------------
function setup()
  of.setCircleResolution(80)
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
   	mosaicBackground(0,0,0,255)

   	for k,v in pairs(myTable) do
		if k == navi then
			of.fill()
    	else
        	of.noFill()
    	end

    	of.setLineWidth(8)
    	of.setColor(255,255,0,myTable[k].alpha)
    	of.drawCircle(myTable[k].posX, myTable[k].posY, myTable[k].radio)
    end

	if showStructure then
        of.setLineWidth(1)
        x = OUTPUT_WIDTH/4
        y = 100
        of.setColor(255)
        of.drawBitmapString(tostring("myTable"), x, y)

        for k,v in pairs(myTable) do
            if k == navi then
                of.fill()
                of.drawLine(x+16, y+34+(20*k), x+16+310, y+34+(20*k))
                cc = 0
                for k2,v2 in pairs(myTable[k]) do
                	of.drawBitmapString(string.format("%s : %s", tostring(k2), tostring(v2)), x+30+300, y+40+(20*k)+(20*cc))
                    cc = cc + 1
                end
            else
            	of.noFill()
           	end

            of.drawRectangle(x+(16*k), OUTPUT_HEIGHT-20, 16, 16)
            of.drawBitmapString(string.format("myTable[%i] - %s", k, tostring(v)), x+16, y+30+(20*k))
       	end
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
	if key == string.byte('a') then
    	object = {}
    	object.posX = of.randomuf()*OUTPUT_WIDTH
    	object.posY = of.randomuf()*OUTPUT_HEIGHT
    	object.alpha = of.random(50, 155)
    	object.radio = of.random(0, OUTPUT_HEIGHT/2)
    	table.insert(myTable, theIndex,object)
    	theIndex = theIndex + 1
  	elseif key == string.byte('r') then
		table.remove(myTable)
		theIndex = theIndex - 1
  	elseif key == string.byte(' ') then
    	if navi <  theIndex then
      		navi = navi + 1
    	else
      		navi = 1
    	end
	elseif key == string.byte('s') then
		showStructure = not showStructure
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