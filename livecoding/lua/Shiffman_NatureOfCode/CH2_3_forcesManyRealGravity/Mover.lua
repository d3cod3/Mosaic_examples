---------------------------------------------------
------- class Mover

-- constructor
Mover = class(
function(this,_m,_x,_y)
	this.location = of.Vec2f(_x,_y)
	this.velocity = of.Vec2f(0,0)
	this.acceleration = of.Vec2f(0,0)
	this.mass = _m
end
)

function Mover:applyForce(force)
	local f = of.Vec2f(0,0)
	f = force/self.mass
	self.acceleration = self.acceleration + f
end

function Mover:update()
	self.velocity = self.velocity + self.acceleration
	self.location = self.location + self.velocity
	self.acceleration = self.acceleration * 0
end

function Mover:draw()
	of.setColor(32, 0, 255,127)
	of.fill()
	of.setLineWidth(2)
	of.drawCircle(self.location.x,self.location.y,self.mass*16)
	of.noFill()
	of.setColor(8,0,64)
	of.drawCircle(self.location.x,self.location.y,self.mass*16)
end

function Mover:checkEdges()
	if self.location.x > OUTPUT_WIDTH then
		self.location.x = OUTPUT_WIDTH
		self.velocity.x = self.velocity.x * -1
	elseif self.location.x < 0 then
		self.velocity.x = self.velocity.x * -1
		self.location.x = 0
	end

	if self.location.y > OUTPUT_HEIGHT then
		self.velocity.y = self.velocity.y * -1
		self.location.y = OUTPUT_HEIGHT
	end

end

---------------------------------------------------
------- end class Mover
