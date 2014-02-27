local SpriteHelper = {}

local Sprite = {}

local spriteSheet
local spriteInfo
local spriteSet = { spriteSheets = {}, spriteInfos = {} }

SpriteHelper.initialize = function ( params )
	
	-- spriteInfo = require( params.path.spriteInfo )

	-- local spriteData = spriteInfo:getSheet()
	-- spriteSheet = graphics.newImageSheet( params.path.spriteImages, spriteData ) 
	
	spriteInfo = require( "images.spritesheet" )

	local spriteData = spriteInfo:getSheet()
	spriteSheet = graphics.newImageSheet( "images/spritesheet.png", spriteData )
end

SpriteHelper.getFrameIndexes = function ( frameNames )
	
	local frameIndexes = {}

	for k, frameName in pairs(frameNames) do
		table.insert( frameIndexs, spriteInfo:getFrameIndex(frameName) )
	end

	return frameIndexes

end

SpriteHelper.newSprite = function ( params )

	local sprite = { };

	local options = { }

	print ("test " .. spriteInfo:getFrameIndex("mapBuild"))
	print ("test2 " .. spriteInfo:getFrameIndex("mapPath"))
	sprite.display = display.newSprite(
			spriteSheet, 
			{  
			frames = { 
				spriteInfo:getFrameIndex("mapBuild"),
				spriteInfo:getFrameIndex("mapPath") 
			}
			
			})
	sprite.display.x = 100
	sprite.display.y = 100
	sprite.display.xScale = 100
	
	sprite.isAlive = true
	sprite.isFinalised = false

	sprite.display:play()

	setmetatable( sprite, Sprite )
	Sprite.__index = Sprite

	return sprite
end

function Sprite:setDeathAnimation( frames )

end

local function finaliseSprite( sprite )
	sprite.isFinalised = true
end

function Sprite:remove()
	self.display:removeSelf( )
	self.display = nil
end

function Sprite:kill()
	self.isAlive = false

	if (self.hasDeathAnimation == true) then

	else
		finaliseSprite(self)
	end

end



function Sprite:test()
	print ("test sprite")
end


return SpriteHelper;