local SpriteHelper = require ("util.spriteHelper")

local DeltaTime = require("deltaTime");
local LevelInfo = require("util.levelInfo")

local Shuriken = {}
Shuriken.group = display.newGroup( )
Shuriken.screen = { height = display.contentHeight, width = display.contentWidth }
Shuriken.maxYSpeed = LevelInfo.speeds.shuriken.maxY
Shuriken.maxXSpeed = LevelInfo.speeds.shuriken.maxX




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

	

	if (hitClass.className == "board") then

		if ( hitClass:isOn() ) then

			if (event.phase == "began") then
				self.parentClass.isHittingBoard = true
				self.parentClass.acceleration.x = 0
				self.parentClass.acceleration.y = 0
			end
			
		end

		if (event.phase == "ended") then
			print ("board collision ended")
			self.parentClass.isHittingBoard = false
			hitClass:shurikenNotHitting()
		end
		
		-- hitClass.isContactingPlayer = false
	end

	return true
end

local function onLocalPreCollision( self, event )
 	
	if (event.contact == nil) then
		return 
	end

	local hitClass = event.other.parentClass

	if (hitClass.className == "board") then
		--print (hitClass:isOn());
		if (hitClass:isOn() == false) then
			print ("shuriken can go through")
			event.contact.isEnabled = false
			hitClass:shurikenHitting()
		end
	end


	print (self.parentClass.className)

	print( event.contact ) --"event.contact" is the physics contact "userdata"
	--the following properties of the collision can be accessed; the last three are settable!
	print( event.contact.isTouching ) --read-only: are the two objects touching?
	print( event.contact.isEnabled ) --'true' or 'false'; will the collision resolve?
	print( event.contact.bounce ) --get/set the bounce factor of the collision
	print( event.contact.friction ) --get/set the friction factor of the collision
 
end


function Shuriken:new( shurikenInfo )
	local shuriken = {}
	print ("play")
	print (shurikenInfo.player)
	shuriken.player = shurikenInfo.player
	shuriken.className = "shuriken"
	shuriken.acceleration = { x = 0, y = 0 }

	local frames = SpriteHelper.getFrameIndexes( "main", { "mapBuild", "mapPath"})

	-- shuriken.display = display.newImageRect("images/grass.png", 50, 50)

	shuriken.display = display.newSprite(
			SpriteHelper.getSheet("main"), 
			{  
			frames = frames,
			time = 500
			
			})
	shuriken.display:play()
	shuriken.display.xScale = 1
	shuriken.display.yScale = 1

	print("Shuriken width" .. shuriken.display.width)

	shuriken.display.parentClass = shuriken

	physics.addBody(shuriken.display, "dynamic", { friction = 0.3, density = 1, bounce = 0.0} )
	
	shuriken.display.x = 50
	shuriken.display.y = 50
	shuriken.display.halfW = shuriken.display.width / 2
	shuriken.display.halfH = shuriken.display.height / 2
	
	shuriken.display.gravityScale = 0
	shuriken.display.isFixedRotation = true

	shuriken.display.collision = onLocalCollision
	shuriken.display.preCollision = onLocalPreCollision

	shuriken.display:addEventListener( "collision", shuriken.display )
	shuriken.display:addEventListener( "preCollision", shuriken.display )

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

    	-- self.display:applyLinearImpulse( 0, -4 )
        self.acceleration.y = self.acceleration.y - 4
    elseif (event.keyName == "s") then
		-- self.display:applyLinearImpulse( 0, 4 )
    	self.acceleration.y = self.acceleration.y + 4
    elseif (event.keyName == "a") then
    	self.acceleration.x = self.acceleration.x - 4
		-- self.display:applyLinearImpulse( -4, 0 )
    	
    elseif (event.keyName == "d") then
    	self.acceleration.x = self.acceleration.x + 4
		-- self.display:applyLinearImpulse( 4, 0 )
    	
    end

    if (self.acceleration.x > Shuriken.maxXSpeed) then
		self.acceleration.x = Shuriken.maxXSpeed
    end
     if (self.acceleration.x < -Shuriken.maxXSpeed) then
		self.acceleration.x = -Shuriken.maxXSpeed
    end

    if (self.acceleration.y < -Shuriken.maxYSpeed) then
		self.acceleration.y = -Shuriken.maxYSpeed
    end

    -- Return false to indicate that this app is *not* overriding the received key.
    -- This lets the operating system execute its default handling of this key.
    return false

end

function Shuriken:update( )

	if (not self.isHittingBoard) then
		self.display:translate( self.acceleration.x * DeltaTime.deltaTime, self.acceleration.y * DeltaTime.deltaTime)
	end

	

	self.display.top = self.display.y - self.display.halfH
	self.display.right = self.display.x + self.display.halfW
	self.display.bottom = self.display.y + self.display.halfH
	self.display.left = self.display.x - self.display.halfW
	
	-- print(self.display.top)
	--print("update")
	
	self.display.rotation = self.display.rotation + 30
	
	if ( self.display.top > LevelInfo.dimensions.bottom ) then
		self.display.y = LevelInfo.dimensions.top
	elseif ( self.display.bottom < LevelInfo.dimensions.top ) then
		self.display.y = LevelInfo.dimensions.bottom
	end
	
	if ( self.display.left > LevelInfo.dimensions.right ) then
		self.display.x = LevelInfo.dimensions.left
	elseif ( self.display.right < LevelInfo.dimensions.left ) then
		self.display.x = LevelInfo.dimensions.right
	end
end

return Shuriken