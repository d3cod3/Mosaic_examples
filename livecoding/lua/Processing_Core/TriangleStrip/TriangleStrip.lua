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
-- Mosaic port to Processing examples [http://www.processing.org]
--
-- TRIANGLE_STRIP Mode by Ira Greenberg.
--
-- Generate a closed ring using the vertex() function and beginShape() mode.
-- The outerRad and innerRad variables control ring's radius respectively.
--
--
-- translated from GAmuza examples by ferhoyo https://github.com/ferhoyo
--
--

-- variables for mouse interaction (DO NOT DELETE)
mouseX = 0
mouseY = 0
---------------------
x = 0
y = 0
outerRad = 0
innerRad = 0
----------------------------------------------------
function setup()
	x = OUTPUT_WIDTH/2;
  y = OUTPUT_HEIGHT/2;
  outerRad = math.min(OUTPUT_WIDTH, OUTPUT_HEIGHT) * 0.4;
  innerRad = outerRad * 0.6;
end

----------------------------------------------------
function update()

end

----------------------------------------------------
function draw()
	of.background(8,0,64)
	pts = math.ceil(of.map(mouseX, 0, OUTPUT_WIDTH, 6, 60,true));
  rot = 180.0/pts;
  _angle = 0;

  of.setColor(0)
  of.beginShape()
  for i=0, pts do
    px = x + math.cos(of.degToRad(_angle)) * outerRad
    py = y + math.sin(of.degToRad(_angle)) * outerRad
    _angle = _angle + rot
    of.vertex(px, py, 0)
    px = x + math.cos(of.degToRad(_angle)) * innerRad
    py = y + math.sin(of.degToRad(_angle)) * innerRad
    of.vertex(px, py, 0)
    _angle = _angle + rot
  end
  of.endShape()

  of.setColor(32, 0, 255)
  of.beginShape()
  for i=0, pts do
    px = x + math.cos(of.degToRad(_angle)) * outerRad
    py = y + math.sin(of.degToRad(_angle)) * outerRad
    _angle = _angle + rot
    of.vertex(px, py, 0)
    px = x + math.cos(of.degToRad(_angle)) * innerRad
    py = y + math.sin(of.degToRad(_angle)) * innerRad
    of.vertex(px, py, 0)
    _angle = _angle + rot
  end
  of.endShape()
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
