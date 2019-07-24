---------------------------------------------------
------- class Attractor

-- constructor
Attractor = class(
	function(this)
		this.mass = 200
		this.G = 1
		this.loc = 0 --of.Vec2f(OUTPUT_WIDTH/2,OUTPUT_HEIGHT/2)
		this.dragging = false
		this.rollover = false
		this.dragOffset = of.Vec2f(0,0)
	end
)

function Attractor:attract(mover)
	force = of.Vec2f()
	-- Calculate direction of force
	force = self.loc - mover.loc
	-- Distance between objects
	d = force:length()
	-- Limiting the distance to eliminate "extreme" results
	-- for very close or very far objects
	d = of.clamp(d,5.0,25.0)
	-- Normalize vector (distance doesn't matter here,
	-- we just want this vector for direction)
	force:normalize()
	-- Calculate gravitional force magnitude
	strength = (self.G*self.mass*mover.mass) / (d * d)
	-- Get force vector --> magnitude * direction
	force = force * strength
	return force
end

function Attractor:update()

end

function Attractor:draw()
	of.setColor(40,40,255)
	of.setLineWidth(4)
	of.noFill()
	of.drawCircle(self.loc.x,self.loc.y,self.mass*0.5)
	of.fill()
	if self.dragging then
		of.setColor(32, 0, 255,200)
	elseif self.rollover then
		of.setColor(8,0,64)
	else
		of.setColor(15,150,255)
	end
	of.drawCircle(self.loc.x,self.loc.y,self.mass*0.5)
end

function Attractor:clicked(mx,my)
	d = of.dist(mx,my,self.loc.x,self.loc.y)
	if d < self.mass then
		self.dragging = true
		self.dragOffset:set(self.loc.x - mx,self.loc.y - my)
	end
end

function Attractor:hover(mx,my)
	d = of.dist(mx,my,self.loc.x,self.loc.y)
	if d < self.mass then
		self.rollover = true
	else
		self.rollover = false
	end
end

function Attractor:stopDragging()
	self.dragging = false
end

function Attractor:drag()
	if self.dragging then
		self.loc:set(mouseX + self.dragOffset.x,mouseY + self.dragOffset.y)
	end
end
---------------------------------------------------
------- end class Attractor
