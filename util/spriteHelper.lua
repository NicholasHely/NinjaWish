local SpriteHelper = {}

local Sprite = {}

local spriteSheet
local spriteInfo

SpriteHelper.initialize = function ( params )
	
	-- spriteInfo = require( params.path.spriteInfo )

	-- local spriteData = spriteInfo:getSheet()
	-- spriteSheet = graphics.newImageSheet( params.path.spriteImages, spriteData ) 

end

SpriteHelper.newSprite = function ( )

	local sprite = { };

	setmetatable( sprite, Sprite )
	Sprite.__index = Sprite

	return sprite
end

function Sprite:test()
	print ("test sprite")
end

return SpriteHelper;