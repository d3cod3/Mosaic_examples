---------------------------------------------------
------- class Particle

-- constructor
Particle = class(
function(this,l)
	this.birth = of.getElapsedTimeMillis()
	this.lifecycle = of.random(10,500)
	this.counter = 0
	this.randmin = -of.HALF_PI
	this.randmax = 0

	this.r = of.random(0,of.TWO_PI)
	this.acc = of.Vec2f(math.cos(this.r)/250,math.sin(this.r)/250)

	this.q = of.randomuf()
	this.r = of.random(this.randmin,this.randmax)
	this.vel = of.Vec2f(math.cos(this.r)*this.q,math.sin(this.r)*this.q)
	this.loc = of.Vec2f(l.x,l.y)
	this.hist = {}
	for i=0, this.lifecycle do
		this.hist[i] = of.Vec2f(0,0)
	end

end
)


function Particle:update()
	self.vel = self.vel + self.acc
	self.loc = self.loc + self.vel
	if (of.getElapsedTimeMillis()-self.birth) % 100 == 0 and self.counter < self.lifecycle then
		self.hist[self.counter] = self.loc
		self.counter = self.counter + 1
	end
end

function Particle:draw()
	of.enableAlphaBlending()
	of.setColor(245,151,176,135)
	drawArrowHead(self.vel,self.loc,16);
	-- draw history path
	of.noFill()
	of.setColor(245,151,176,55)
	of.beginShape()
	for i=0,self.counter-1 do
		of.vertex(self.hist[i].x,self.hist[i].y)
	end
	if self.counter > 0 then
		of.vertex(self.loc.x,self.loc.y)
	end
	of.endShape(false)
	of.disableAlphaBlending()
end

function drawArrowHead(_v,_loc,_scale)
	of.pushMatrix()
	_len = _v:length()*_scale
	arrowSize = of.map(_len,0,10,0,1)*6
	of.translate(_loc.x,_loc.y,0)
	of.rotateZDeg(of.radToDeg(math.atan(_v.y,_v.x)))
	of.fill()
	of.drawLine(0,0,_len-arrowSize,0)
	of.beginShape()
	of.vertex(_len,0)
	of.vertex(_len-arrowSize, arrowSize/2);
	of.vertex(_len-arrowSize,-arrowSize/2);
	of.endShape(true)
	of.popMatrix()
end
---------------------------------------------------
------- end class Particle
