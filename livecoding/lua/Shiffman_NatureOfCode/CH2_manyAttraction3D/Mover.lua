---------------------------------------------------
------- class Mover

-- constructor
Mover = class(
function(this,_m,_x,_y,_z)
	this.mass = _m
	this.loc = of.Vec3f(_x,_y,_z)
	this.vel = of.Vec3f(1,0,0)
	this.acc = of.Vec3f(0,0,0)
end
)

function Mover:applyForce(force)
	f = of.Vec3f()
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
	of.pushMatrix()
	of.translate(self.loc.x,self.loc.y,self.loc.z)
	of.drawSphere(self.mass*2)
	of.popMatrix()
end

function Mover:checkEdges()
	if self.loc.x > OUTPUT_WIDTH then
		self.loc.x = 0
		self.vel.x = self.vel.y * -1
	elseif self.loc.x < 0 then
		self.loc.x = OUTPUT_WIDTH
		self.vel.x = self.vel.y * -1
	end
	if self.loc.y > OUTPUT_HEIGHT then
		self.vel.y = self.vel.y * -1
		self.loc.y = height
	end
end
---------------------------------------------------
------- end class Mover
