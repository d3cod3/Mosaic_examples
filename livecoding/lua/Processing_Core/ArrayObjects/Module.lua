---------------------------------------------------
------- class Module
-- to import in main file: require("Module")


-- constructor
Module = class(
	function(this,_xOff, _yOff, _posX, _posY, _speed, _unit)
		this.xOff = _xOff
		this.yOff = _yOff
		this.posX = _posX
		this.posY = _posY
		this.speed = _speed
		this.unit = _unit

		this.xDirection = 1
		this.yDirection = 1
		-- .......
	end
)

function Module:update()
	self.posX = self.posX + (self.speed*self.xDirection)

	if self.posX >= self.unit or self.posX <= 0  then
		self.xDirection = self.xDirection * -1
		self.posX = self.posX + (1*self.xDirection)
		self.posY = self.posY + (1*self.yDirection)
	end
	if self.posY >= self.unit or self.posY <= 0 then
		self.yDirection = self.yDirection * -1
		self.posY = self.posY + (1*self.yDirection)
	end
end

function Module:draw()
  of.setColor(255)
 	of.drawCircle(self.xOff+self.posX,self.yOff+self.posY,6)
end

---------------------------------------------------
------- end class Module
