-- Attractor CLASS
-- to import in main file: require("Attractor")

-- constructor
Attractor = class(
	function(this)
    this.x = 0
    this.y = 0
	end
)

function Attractor:setup(w,h)
  self.x = of.random(w)
  self.y = of.random(h)
end


function Attractor:update()

end
