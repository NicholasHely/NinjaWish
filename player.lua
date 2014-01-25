

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
		self.score = self.score + 5
	elseif ( balloon.type == "red" ) then
		self:loseLife ( )
	end
	
	balloon:kill()
	
	print ( self.score )
end

function Player:loseLife()
	self.lives = self.lives - 1
end

return Player