---------------------------------------------------
------- class Mover

-- constructor
Mover = class(
	function(this)
		this.location = of.Vec2f(of.random(OUTPUT_WIDTH),of.random(OUTPUT_HEIGHT))
	this.velocity = of.Vec2f(0,0)
	this.acceleration = of.Vec2f(0,0)
	this.topSpeed = 10
	end
)

function Mover:update()
self.acceleration = mouse-self.location
	self.acceleration:normalize()
	self.acceleration = self.acceleration * 0.9

	self.velocity = self.velocity + self.acceleration
	self.velocity:limit(self.topSpeed)
	self.location = self.location + self.velocity
end

function Mover:draw()
of.setColor(32, 0, 255)
	of.fill()
	of.setLineWidth(2)
 	of.drawCircle(self.location.x,self.location.y,48)
	of.noFill()
	of.setColor(8,0,64)
	of.drawCircle(self.location.x,self.location.y,48)
end

function Mover:checkEdges()
	if self.location.x > OUTPUT_WIDTH then	self.location.x = 0	end
	if self.location.x < 0 then	self.location.x = OUTPUT_WIDTH	end
	if self.location.y > OUTPUT_HEIGHT then	self.location.y = 0	end
	if self.location.y < 0 then	self.location.y = OUTPUT_HEIGHT	end
end
---------------------------------------------------
------- end class Mover
