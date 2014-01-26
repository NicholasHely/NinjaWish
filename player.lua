

local Player = {}
local Shuriken = require( "shuriken" ) 

function Player:new( playerInfo )
	player = {}
	player.shuriken = Shuriken:new( {player = player, type = "somethinb"} )	
	player.className = "player"
	player.lives = 3
	player.score = 0
	
	setmetatable( player, self )
	self.__index = self

	return player
end

function Player:update()

	self.shuriken:update()
end

function Player:hitBalloon( shuriken, balloon )

	if ( balloon.type == "green" ) then
		self.score = self.score + 5
	elseif ( balloon.type == "red" ) then
		self:loseLife ( )
	end
	
	balloon:kill()
	
	print ( "players score: " .. self.score )
end

function Player:accelerometerChanged(event)

	

	self.shuriken:accelerometerChanged( event )

	print ("Gravity X: " .. event.xGravity .. " y: " .. event.yGravity)
end

function Player:balloonReachedTop(balloon)
	if (balloon.type == "green") then
		self:loseLife()
	end
end

function Player:loseLife()
	self.lives = self.lives - 1
	print ("player lost life -- lives left: " .. self.lives)
end

function Player.insertShurikenGroup(group)
	group:insert( Shuriken.group )
end

return Player