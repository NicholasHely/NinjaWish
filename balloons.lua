require ("balloonPatterns")

local Balloon = require( "Balloon" )
local Balloons = {}

local Balloons.balloonsAcross = 15

Balloons.group = display.newGroup( )
Balloon.group = Balloons.group


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

	self:createBalloons(getPattern(balloonPattern))

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

	local initialX = 0 --pattern[1].position.x;
	
	
	local positionType = pattern.info.type

	if (positionType == "relative") then
		local width = pattern.info.width

		local leftMostBalloon = pattern.info.left

		local lastAvailablePosition = Balloon.screen.width - (self.balloonSize * width)

		

		-- gives me a random screen position
		initialX = math.random( ) * Balloons.screen.width

	elseif (positionType == "fixed") then

	end


	for k, balloonValues in pairs (pattern) do
		
		local balloonType = balloonValues.type
		local balloonPosition = balloonValues.position

		local balloonX, balloonY = 0, Balloons.screen.height

		if (balloonPosition.type == "fixed") then
			balloonX = balloonPosition.x * Balloons.screen.width
		else

		end

		print (balloonValues)

		local options = options or { type = "green", x = 0, y = Balloons.screen.height }
		local balloon = Balloon:new( options )
		table.insert( self.currentBalloons, balloon )
	end

	

end

return Balloons
