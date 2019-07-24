---------------------------------------------------
------- class Mover

-- constructor
Mover = class(
	function(this)
		this.loc = of.Vec2f(540,80)
		this.vel = of.Vec2f(1,0)
		this.acc = of.Vec2f(4,0)
		this.mass = 1
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
	of.drawCircle(self.loc.x,self.loc.y,16)
	of.setColor(32, 0, 255,200)
	of.fill()
	of.drawCircle(self.loc.x,self.loc.y,16)
end

function Mover:checkEdges()
	if self.loc.x > OUTPUT_WIDTH then
		self.loc.x = OUTPUT_WIDTH
		self.vel.x = self.vel.x * -1
	elseif self.loc.x < 0 then
		self.vel.x = -self.vel.x * 1
		self.loc.x = 0
	end

	if self.loc.y > OUTPUT_HEIGHT then
		self.vel.y = self.vel.y * -1
		self.loc.y = OUTPUT_HEIGHT
	end
end
---------------------------------------------------
------- end class Mover
