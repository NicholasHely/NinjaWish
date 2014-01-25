local Balloon = {}

function Balloon:new( balloonInfo )
	local balloon = {}
	
	--TODO: different image based off type
	--TODO: change image to sprites to allow animation on balloons
	balloon.className =  "balloon"
	balloon.type = balloonInfo.type

	balloon.display = display.newImageRect( "crate.png", 50, 50 )
	balloon.display.x = balloonInfo.position.x
	balloon.display.y = balloonInfo.position.y
	
	
	-- 0 density so that the shuriken does not slow down when it hits the balloon
	physics.addBody( balloon.display, "dynamic", { density = 0, friction=0, bounce = 0, filter={1} } )

	balloon.display.gravityScale = 0
	balloon.display.parentClass = balloon

	Balloon.group:insert(balloon.display)

	balloon.isAlive = true
	balloon.isFinalised = false

	--balloon.display:applyForce( 0, -.02, balloon.display.x, balloon.display.y)
	balloon.display:applyLinearImpulse( 0, -.02, balloon.display.x, balloon.display.y )

	setmetatable( balloon, self )
	self.__index = self

	return balloon
end

function Balloon:kill( )
	--self.display.isBody = false
	self.display.isSensor = true
	self.isAlive = false;
	print ("balloon killed")
end


function Balloon:update( )
	
	-- print ("updating balloon")
	-- means we want to remove this dead balloon from the field
	if (self.isAlive == false and self.display ~= nil) then
		self.isFinalised = true
		self.display:removeSelf( )
		self.display.parentClass = nil
		self.display = nil
	end

end



return Balloon