---------------------------------------------------
------- class Attractor

-- constructor
Attractor = class(
function(this)
	this.mass = 20
	this.loc = of.Vec3f(0,0,0)
	this.g = 3.4
end
)

function Attractor:attract(mover)
	force = of.Vec3f()
	force = self.loc - mover.loc
	d = force:length()
	d = of.clamp(d,5.0,25.0)
	force:normalize()
	strength = (self.g*self.mass*mover.mass) / (d^2)
	force = force * strength
	return force
end

function Attractor:update()

end

function Attractor:draw()
	of.setColor(8,0,64)
	of.noFill()
	of.pushMatrix()
	of.translate(self.loc.x,self.loc.y,self.loc.z)
	of.drawSphere(self.mass*6)
	of.popMatrix()
end

---------------------------------------------------
------- end class Attractor
