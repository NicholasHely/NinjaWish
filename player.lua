

local Player = {}

function Player:new( playerInfo )
	player = {}
	
	player.className = "player"
	player.lives = 3
	player.score = 0
	setmetatable( player, self )
	self.__index = self

	return player
end


function Player:hitBalloon( shuriken, balloon )

	if ( balloon.type == "green" ) then
		player.score = player.score + 5
	end
	
	balloon:kill()
	
	print ( player.score )
end

return Player