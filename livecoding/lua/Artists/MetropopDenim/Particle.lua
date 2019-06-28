-- Particle CLASS
-- to import in main file: require("Particle")

-- constructor
Particle = class(
  function(this)
    this.x = 0
    this.y = 0
    this.a = 6000
    this.d = 0.00002
    this.vx = of.random(-this.a/2,this.a/2)
    this.vy = of.random(-this.a/2,this.a/2)

    this.attr = {}
  end
)

function Particle:setup(w,h,a)
  self.x = of.random(w)
  self.y = of.random(h)
  self.attr = a
end

function Particle:step(num)
  for i=1,num do
    d2 = (self.attr[i].x-self.x)*(self.attr[i].x-self.x) + (self.attr[i].y-self.y)*(self.attr[i].y-self.y)

    if d2 > 0.1 then
      self.vx = self.vx + (self.a*(self.attr[i].x-self.x) / d2)
      self.vy = self.vy + (self.a*(self.attr[i].y-self.y) / d2)
    end
  end

  self.x = self.x + self.vx
  self.y = self.y + self.vy

  self.vx = self.vx*self.d
  self.vy = self.vy*self.d
end
