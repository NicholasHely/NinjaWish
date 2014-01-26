

local Shuriken = {}
Shuriken.group = display.newGroup( )
Shuriken.screen = { height = display.contentHeight, width = display.contentWidth }
Shuriken.maxYSpeed = Shuriken.screen.height / 20
Shuriken.maxXSpeed = Shuriken.screen.width / 20

local DeltaTime = require("deltaTime");

local function onLocalCollision( self, event )

	print("test collision")

	local hitClass = event.other.parentClass

	if (hitClass == nil) then
		return true
	end

	if (event.phase == "began" and hitClass.className == "balloon") then
		-- local vx, vy = self:getLinearVelocity( )
		-- self:setLinearVelocity( vx, vy )
		
		self.parentClass.player:hitBalloon(self.parentClass, hitClass)
		-- class:kill()
		-- class:kill()

	end

	return true
end

function Shuriken:new( shurikenInfo )
	shuriken = {}
	print ("play")
	print (shurikenInfo.player)
	shuriken.player = shurikenInfo.player
	shuriken.className = "shuriken"
	shuriken.acceleration = { x = 0, y = 0 }

	shuriken.display = display.newImageRect("grass.png", 50, 50)
	shuriken.display.parentClass = shuriken

	physics.addBody(shuriken.display, "dynamic", { friction = 0.3, density = 1, bounce = 0.0} )
	
	shuriken.display.x = 50
	shuriken.display.y = 50
	shuriken.display.halfW = shuriken.display.width / 2
	shuriken.display.halfH = shuriken.display.height / 2
	
	shuriken.display.gravityScale = 0
	shuriken.display.isFixedRotation = true

	shuriken.display.collision = onLocalCollision
	shuriken.display:addEventListener( "collision", shuriken.display )

	Shuriken.group:insert( shuriken.display )

	setmetatable( shuriken, self )
	self.__index = self

	return shuriken
end

function Shuriken:accelerometerChanged( event )
	local xAcceleration, yAcceleration = -event.yGravity, -event.xGravity

	

	xAcceleration = xAcceleration * Shuriken.maxXSpeed
	yAcceleration = yAcceleration * Shuriken.maxYSpeed

	self.acceleration = { x = xAcceleration, y = yAcceleration }
end

function Shuriken:handleEvent ( event )

	if (event.keyName == "w") then
    	self.display:applyLinearImpulse( 0, -4 )
        return true
    elseif (event.keyName == "s") then
		self.display:applyLinearImpulse( 0, 4 )
    	return true
    elseif (event.keyName == "a") then
		self.display:applyLinearImpulse( -4, 0 )
    	return true
    elseif (event.keyName == "d") then
		self.display:applyLinearImpulse( 4, 0 )
    	return true
    end

    -- Return false to indicate that this app is *not* overriding the received key.
    -- This lets the operating system execute its default handling of this key.
    return false

end

function Shuriken:update( )

	self.display:translate( self.acceleration.x * DeltaTime.deltaTime, self.acceleration.y * DeltaTime.deltaTime)

	self.display.top = self.display.y - self.display.halfH
	self.display.right = self.display.x + self.display.halfW
	self.display.bottom = self.display.y + self.display.halfH
	self.display.left = self.display.x - self.display.halfW
	
	-- print(self.display.top)
	--print("update")
	
	self.display.rotation = self.display.rotation + 30
	if ( self.display.top > Shuriken.screen.height ) then
		self.display.y = 0
	elseif ( self.display.bottom < 0 ) then
		self.display.y = Shuriken.screen.height
	end
	
	if ( self.display.left > Shuriken.screen.width ) then
		self.display.x = 0
	elseif ( self.display.right < 0 ) then
		self.display.x = Shuriken.screen.width
	end
end

return Shuriken