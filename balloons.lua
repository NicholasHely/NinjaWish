require ("balloonPatterns")

local Balloon = require( "balloon" )
local LevelInfo = require("util.levelInfo")

local Balloons = {}
		

Balloons.screen = { width = display.contentWidth, height = display.contentHeight}
Balloons.balloonsAcross = 15
Balloons.size = LevelInfo.dimensions.width / Balloons.balloonsAcross
Balloons.group = display.newGroup( )
Balloon.group = Balloons.group

-- values that determine how far right and left a balloon can be
local rightMost = (LevelInfo.dimensions.right - Balloons.size * .5)
local leftMost = LevelInfo.dimensions.left + (Balloons.size * .5)	

print ("Display size" .. display.contentWidth)

function Balloons:new( )
	local balloons = {}
	balloons.currentBalloons = { }
	balloons.balloonSize = Balloons.screen.width / Balloons.balloonsAcross

	setmetatable( balloons, self )
	self.__index = self
	
	

	return balloons
end


function Balloons:checkBalloons()

	local balloonPattern = math.random(1)
	if (self.currentBalloons[1] == nil) then
		self:createBalloons(getPattern(balloonPattern))
	end
	

	-- if (balloonPattern == 1) then

	-- 	print (getPattern(balloonChance))

	-- end


end

function Balloons:update( )

	self:checkBalloons()

	for k, balloon in pairs(self.currentBalloons) do
		-- print ("we got a balloon")
		balloon:update( )

		-- remove the balloon from the list if it
		-- is finished
		if (balloon.isFinalised == true) then
			self.currentBalloons[k] = nil
		end
	end

end

function Balloons:validatePosition( x, left, width)


end

function Balloons:createBalloons( pattern )

	 --pattern[1].position.x;
	
	
	local positionType = pattern.info.type

	local initialX = 0
	--if (positionType == "relative") then

		--local initialX = 0

	-- initialX = math.random( )



	local width = pattern.info.width

	local leftMostBalloon = pattern.balloonValues[pattern.info.left]
		

	local lastAvailablePosition = Balloons.screen.width - (self.balloonSize * width)

	
	-- if (leftMostBalloon.position.type == "random") then

	-- elseif (leftMostBalloon.position.type == "fixed") then
				
	-- end
	local initialPosition = self:getBalloonPosition( nil, width, leftMostBalloon.position )
	-- gives me a random screen position
	
	--initialX = 1000000

	
	-- print ("Initial X: " .. initialX)

	for k, balloonValues in pairs (pattern.balloonValues) do
		

		local balloonType = balloonValues.type
		local balloonPosition = balloonValues.position

		local balloonX, balloonY = 0, Balloons.screen.height
		--print (balloonValues)
		local balloonAbsolutePosition = nil

		if (k == 1) then
			balloonAbsolutePosition = initialPosition
		else
			balloonAbsolutePosition = self:getBalloonPosition(initialPosition, 1, balloonPosition)
		end 

		local balloon = Balloon:new ( 
			{
			 player = Balloons.player,
			 type = balloonType, 
			 size = Balloons.size, 
			 position = balloonAbsolutePosition,
			 speed = -1
			})
		table.insert( self.currentBalloons, balloon )
		-- if (balloonPosition.type == "fixed") then
		-- 	balloonX = balloonPosition.x * Balloons.screen.width
		-- else
-- 
		-- end

		-- print (balloonValues)

		-- local options = options or { type = "green", x = 0, y = Balloons.screen.height }
		-- local balloon = Balloon:new( options )
		-- table.insert( self.currentBalloons, balloon )
	end

	

end

function Balloons:getBalloonPosition( startingBalloonPosition, width, position )

	local initialX = 0;
	local initialY = LevelInfo.dimensions.bottom
	
	if (position.type == "random") then
		initialX = math.random( ) * LevelInfo.dimensions.width + LevelInfo.dimensions.left
	elseif (position.type == "fixed") then
		initialX = Balloons.screen.width * leftMostBalloon.position.x
	elseif (position.type == "relative") then
		initialX = startingBalloonPosition.x + (position.x * Balloons.size)
	end
	local leftMostBalloonRightMost = rightMost - (Balloons.size * width)

	if (initialX < leftMost) then
		initialX = leftMost
	elseif (initialX > leftMostBalloonRightMost) then
		initialX = leftMostBalloonRightMost
	end
	print (position.x)
	initialY = initialY + (position.y * Balloons.size)

	return {x = initialX, y = initialY};
end

return Balloons
