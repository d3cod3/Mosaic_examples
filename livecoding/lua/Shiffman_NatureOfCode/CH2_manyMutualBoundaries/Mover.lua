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
	of.setColor(32, 0, 255)
	of.noFill()
	of.drawCircle(self.loc.x,self.loc.y,self.mass*16)
	of.setColor(32, 0, 255,100)
	of.fill()
	of.drawCircle(self.loc.x,self.loc.y,self.mass*16)
end

function Mover:attract(m)
	f = of.Vec2f()
	f = self.loc - m.loc
	dist = f:length()
	dist = of.clamp(dist,5.0,25.0)
	f:normalize()

	strength = of.Vec2f()
	strength = (g * self.mass * m.mass) / (dist*dist)
	f = f * strength
	return f
end

function Mover:boundaries()
	d = 50
	frc = of.Vec2f(0,0)
	if self.loc.x < d then
		frc.x = 1
	elseif self.loc.x > OUTPUT_WIDTH-d then
		frc.x = -1
	end

	if self.loc.y < d then
		frc.y = 1
	elseif self.loc.y > OUTPUT_HEIGHT-d then
		frc.y = -1
	end

	frc:normalize()
	frc = frc * 0.1

	self:applyForce(frc)
end

---------------------------------------------------
------- end class Mover
