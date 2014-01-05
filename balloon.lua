local Balloon = {}

function Balloon:new( balloonInfo )
	local balloon = {}
	
	--TODO: different image based off type
	--TODO: change image to sprites to allow animation on balloons
	balloon.display = display.newImageRect( "crate.png", 50, 50 )
	balloon.display.x = 500
	balloon.display.y = 500
	balloon.className =  "balloon"
	balloon.type = "green"
	
	-- 0 density so that the shuriken does not slow down when it hits the balloon
	physics.addBody( balloon.display, "dynamic", { density = 0, friction=.2, bounce=.5  } )

	balloon.display.gravityScale = 0
	balloon.display.parentClass = balloon

	Balloon.group:insert(balloon.display)

	balloon.isAlive = true
	balloon.isFinalised = false

	setmetatable( balloon, self )
	self.__index = self

	return balloon
end

function Balloon:kill( )

	self.isAlive = false;
	print ("balloon killed")
end


function Balloon:update( )
	
	print ("updating balloon")
	-- means we want to remove this dead balloon from the field
	if (self.isAlive == false and self.display ~= nil) then
		self.isFinalised = true
		self.display:removeSelf( )
		self.display.parentClass = nil
		self.display = nil
		

	end


end



return Balloon