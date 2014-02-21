local SpriteHelper = {}

local Sprite = {}

local spriteSheet
local spriteInfo

SpriteHelper.initialize = function ( params )
	
	-- spriteInfo = require( params.path.spriteInfo )

	-- local spriteData = spriteInfo:getSheet()
	-- spriteSheet = graphics.newImageSheet( params.path.spriteImages, spriteData ) 

	spriteInfo = require( "images.spritesheet" )

	local spriteData = spriteInfo:getSheet()
	spriteSheet = graphics.newImageSheet( "images/spritesheet.png", spriteData )
end

SpriteHelper.newSprite = function ( params )


	local sprite = { };

	sprite.display = display.newSprite(
			spriteSheet, 
			{  
			start = spriteInfo:getFrameIndex("mapBuild"), 
			count = 2,
			time = 500
			})

	sprite.isAlive = true
	sprite.isFinalised = false

	

	setmetatable( sprite, Sprite )
	Sprite.__index = Sprite

	return sprite
end

local function finaliseSprite( sprite )
	
end

-- function Spirte:kill()
-- 	self.isAlive = false

-- 	if (self.hasDeathAnimation == true) then

-- 	else
-- 		finaliseSprite(self)
-- 	end

-- end



function Sprite:test()
	print ("test sprite")
end


return SpriteHelper;