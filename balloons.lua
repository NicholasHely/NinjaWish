local Balloon = require( "Balloon" )
local Balloons = {}
Balloons.group = display.newGroup( )
Balloon.group = Balloons.group

function Balloons:new( )
	balloons = {}
	balloons.currentBalloons = { }

	setmetatable( balloons, self )
	self.__index = self
	
	
	return balloons
end


function Balloons:update( )

	for k, balloon in pairs(self.currentBalloons) do
		print ("we got a balloon")
		balloon:update( )
		-- remove the balloon from the list if it
		-- is finished
		if (balloon.isFinalised == true) then
			self.currentBalloons[k] = nil
		end
	end

end

function Balloons:createBalloon( options )

	local options = options or { type = "green", x = 0, y = Balloons.screen.height }

	local balloon = Balloon:new( options )
	
	table.insert( self.currentBalloons, balloon )

	return balloon

end

return Balloons
