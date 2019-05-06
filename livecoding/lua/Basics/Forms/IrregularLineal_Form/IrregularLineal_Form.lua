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
--	IrregularLinealForm.lua: A Lua script example for irregular form with table, for Mosaic,
--	mimicking the standard OF app structure
--
--


-- variables for mouse interaction
mouseX = 0
mouseY = 0

---------
vertex= {}

----------------------------------------------------
function setup()
	reset() -- custom function below
			-- release mouse button to generate new vertex
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(0)
	of.setLineWidth(4)
	of.setColor(255)
	of.beginShape()
	for i = 0, 50 do
		of.vertex(vertex[i].x, vertex[i].y)
	end
	of.endShape()
end

----------------------------------------------------
function reset()
	for i = 0, 50 do
		vertex[i]= {}
		vertex[i].x = of.random(OUTPUT_WIDTH)
		vertex[i].y = of.random(OUTPUT_HEIGHT)
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
	reset() -- release mouse button to generate new vertex

end

function mouseScrolled(x,y)

end
