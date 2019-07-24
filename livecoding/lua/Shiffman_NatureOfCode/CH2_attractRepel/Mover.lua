---------------------------------------------------
------- class Mover

-- constructor
Mover = class(
	function(this,_m,_x,_y)
		this.loc = of.Vec2f(_x,_y)
		this.vel = of.Vec2f(1,0)
		this.acc = of.Vec2f(0,0)
		this.mass = _m
	end
)

function Mover:applyForce(force)
	f = of.Vec2f()
	f = force / self.mass
	self.acc = self.acc + f
end

function Mover:update()
	self.vel = self.vel + self.acc
	self.loc = self.loc + self.vel
	self.acc = self.acc * 0
end

function Mover:draw()
	of.setColor(40,40,255)
	of.noFill()
	of.setLineWidth(2)
	of.drawCircle(self.loc.x,self.loc.y,self.mass*2)
	of.setColor(32, 0, 255,100)
	of.fill()
	of.drawCircle(self.loc.x,self.loc.y,self.mass*2)
end

function Mover:repel(mover)
	force = of.Vec2f()
	force = self.loc - mover.loc
	distance = force:length()
	distance = of.clamp(distance,1.0,10000.0)
	force = force:normalize()

	strenght = (g*self.mass*mover.mass) / (distance * distance)
	force = force * (1-strenght)
	return force
end

function Mover:checkEdges()
	if self.loc.x > OUTPUT_WIDTH then
		self.loc.x = OUTPUT_WIDTH
		self.vel.x = self.vel.x * -0.9
	elseif self.loc.x < 0 then
		self.vel.x = -self.vel.x * 0.9
		self.loc.x = 0
	end

	if self.loc.y > OUTPUT_HEIGHT then
		self.vel.y = self.vel.y * -0.9
		self.loc.y = OUTPUT_HEIGHT
	elseif self.loc.y < 0 then
		self.loc.y = 0
		self.vel.y = self.vel.y * -0.9
	end
end
---------------------------------------------------
------- end class Mover
