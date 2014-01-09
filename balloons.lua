require ("balloonPatterns")

local Balloon = require( "Balloon" )
local Balloons = {}
Balloons.group = display.newGroup( )
Balloon.group = Balloons.group


function Balloons:new( )
	local balloons = {}
	balloons.currentBalloons = { }

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

function Balloons:createBalloons( pattern )

	local initialX = pattern[1].position.x;
	
	
	for k, balloonValues in pairs (pattern) do
		
		local balloonType = balloonValues.type
		local balloonPosition = balloonValues.position

		local balloonX, balloonY = 0, Ballons.screen.height

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
