---------------------------------------------------
------- class Ring

-- constructor
Ring = class(
	function(this,px,py,diam)
		-- create here all the needed class variables
		-- is necessary to use this when creating a new variable
		this.posX = px
	    this.posY = py
	    this.diamH = diam+of.random(-6,6)
	    this.diamV = diam+of.random(-6,6)
		this.diamMult = 1.0

	    this.red = 0
	    this.green = 0
	    this.blue = 0
		this.alpha = 0

        this.rand = {}
		-- .......
	end
)

-- After defining the class Constructor, we can access every
-- defined class variable with self.variableName
-- Example: self.posX or self.rand in this case

function Ring:setup()
	for i=0,3 do
		self.rand[i] = of.random(-6,6)
	end
end

function Ring:draw()
    of.noFill()

	of.setColor(self.red,self.green,self.blue,self.alpha)

	of.drawEllipse(self.posX+self.rand[0],self.posY+self.rand[1],self.diamH*self.diamMult,self.diamV*self.diamMult)
	of.drawEllipse(self.posX,self.posY,self.diamH*self.diamMult,self.diamV*self.diamMult)
	of.drawEllipse(self.posX+self.rand[2],self.posY+self.rand[3],self.diamH*self.diamMult,self.diamV*self.diamMult)
end

function Ring:setDiameterMultiplier(m)
	self.diamMult = m
end

function Ring:changeColor(r,g,b,a)
	self.red = r
	self.green = g
	self.blue = b
	self.alpha = a
end

---------------------------------------------------
------- end class Ring
