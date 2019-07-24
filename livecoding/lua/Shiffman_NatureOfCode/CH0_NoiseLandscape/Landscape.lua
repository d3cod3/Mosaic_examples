---------------------------------------------------
------- class Landscape
-- to import in main file: require("Landscape")


-- constructor
Landscape = class(
function(this,_scl, _w, _h)
  this.scl 	= _scl
  this.w 	= _w
  this.h = _h
  this.cols = math.ceil(this.w/this.scl)
  this.rows = math.ceil(this.h/this.scl)
  this.z = {}
  for i=0,this.cols-1 do
    this.z[i] = {}
  end
  this.zoff = 0
end
)

function Landscape:update()
  xoff = 0
  for i=0, self.cols-1 do
    yoff = 0
    for j=0,self.rows-1 do
      self.z[i][j] = of.map(of.noise(xoff,yoff,self.zoff),0.15,0.85,-120,120,true)
      yoff = yoff + 0.1
    end
    xoff = xoff + 0.1
  end
  self.zoff = self.zoff + 0.01
end

function Landscape:draw()
  of.setColor(0)
  of.noFill()
  for i=0,self.cols-2 do
    for j=0,#self.z[i]-2 do
      of.pushMatrix()
      of.beginShape()
      of.translate(i*self.scl - self.w/2,j*self.scl - self.h/2,0)
      of.vertex(0,0,self.z[i][j])
      of.vertex(self.scl,0,self.z[i+1][j])
      of.vertex(self.scl,self.scl,self.z[i+1][j+1])
      of.vertex(0,self.scl,self.z[i][j+1])
      of.endShape(true)
      of.popMatrix()
    end
  end
end

---------------------------------------------------
------- end class Landscape
