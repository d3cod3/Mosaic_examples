--
--
--	----------------------------------------------------------
--	Mosaic | OF Visual Patching Developer Platform
--
--	Copyright (c) 2020 Emanuele Mazza aka n3m3da
--
--	Mosaic is distributed under the MIT License.
--	This gives everyone the freedoms to use Mosaic in any context:
--	commercial or non-commercial, public or private,
--	open or closed source.
--
--  See https://github.com/d3cod3/Mosaic for documentation
--	----------------------------------------------------------
--
--
--	binaryRing.lua: This example is from Binary Ring piece by Jared Tarbel, 2004.

-- Particle CLASS

-- constructor
Particle = class(
  function(this,Dx,Dy,r,OW,OH,b)
		this.Dx = Dx
		this.Dy = Dy
		this.r = r
		this.ox = OW/2
		this.oy = OH/2
		this.x = math.ceil(this.ox-this.Dx)
		this.y = math.ceil(this.oy-this.Dy)
		this.xx = 0
		this.yy = 0
		this.vx = 2*math.cos(this.r)
		this.vy = 2*math.sin(this.r)
		this.age = of.random(0,200)
		this.c = of.Color()
		this.blackout = b

		if this.blackout then
			this.c:set(0,0,0,24)
		else
			this.c:set(255,255,255,24)
		end

  end
)

function Particle:update(b)

	self.blackout = b

	self.xx = self.x
	self.yy = self.y

	self.x = self.x + self.vx
	self.y = self.y + self.vy

	self.vx = self.vx + (of.randomf()/2)
	self.vy = self.vy + (of.randomf()/2)

	-- grow old
	self.age = self.age + 1
	if self.age > 200 then
			local t = of.random(of.TWO_PI)
			self.x = 3*math.sin(t)
			self.y = 3*math.cos(t)
			self.xx = 0
			self.yy = 0
			self.vx = 0
			self.vy = 0
			self.age = 0
			if self.blackout then
					self.c:set(0,0,0,24)
			else
					self.c:set(255,255,255,24)
			end
	end
end

function Particle:draw()
	of.noFill()
	of.setColor(self.c)
	of.drawLine(self.ox+self.xx,self.oy+self.yy,self.ox+self.x,self.oy+self.y)
  of.drawLine(self.ox-self.xx,self.oy+self.yy,self.ox-self.x,self.oy+self.y)
end

----------------------------------- MOSAIC VARS (DO NOT TOUCH)
mosaic_data_inlet_size = 0
----------------------------------- MOSAIC VARS (DO NOT TOUCH)

blackout = false
kaons = {}
numKaons = 1000

----------------------------------------------------
function setup()

	for i=0,numKaons-1 do
		local emitx = math.ceil(3*math.sin(of.TWO_PI*i/numKaons)+OUTPUT_WIDTH/2)
		local emity = math.ceil(3*math.cos(of.TWO_PI*i/numKaons)+OUTPUT_HEIGHT/2)
		local r = of.PI*i/numKaons
		kaons[i] = Particle(emitx,emity,r,OUTPUT_WIDTH,OUTPUT_HEIGHT,blackout)
	end

end

----------------------------------------------------
function update()

	------------------------------------------------ MOSAIC CODE
	mosaic_data_inlet_size = getMosaicDataInletSize()
	------------------------------------------------ MOSAIC CODE

	for i=0,numKaons-1 do
		kaons[i]:update(blackout)
  end

  local r = of.randomuf()
  if r > 0.9991 then
  	blackout = not blackout
  end

end

----------------------------------------------------
function draw()

	------------------------------------------------ MOSAIC CODE
	checkMosaicDataInlet()
	------------------------------------------------ MOSAIC CODE

	-- draw background first
	mosaicBackground(0,0,0,0.1)

	for i=0,numKaons-1 do
		kaons[i]:draw()
  end


end


----------------------------------------------------
function mouseReleased(x,y)
	blackout = not blackout
end
