local SpriteHelper = {}

local Sprite = {}

local spriteSheet
local spriteInfo
local spriteSet = { spriteSheets = {}, spriteInfos = {} }

SpriteHelper.initialize = function ( params )
	
	-- spriteInfo = require( params.path.spriteInfo )

	-- local spriteData = spriteInfo:getSheet()
	-- spriteSheet = graphics.newImageSheet( params.path.spriteImages, spriteData ) 
	
	-- if ( params == nil ) then
	-- 	return false
	-- end


	for k, spriteInfo in pairs( params.spriteInfos ) do
		spriteSet.spriteInfos[k] = require( spriteInfo )
	end

	for k, spriteSheet in pairs( params.spriteSheets ) do
		spriteSet.spriteSheets[k] = graphics.newImageSheet( spriteSheet, spriteSet.spriteInfos[k]:getSheet() )
	end

	-- return true

	--spriteInfo = require( "images.spritesheet" )

	-- local spriteData = spriteInfo:getSheet()
	-- spriteSheet = graphics.newImageSheet( "images/spritesheet.png", spriteData )
end

SpriteHelper.getSheet = function ( sheet )
	
	return spriteSet.spriteSheets[sheet]

end

SpriteHelper.getFrameIndexes = function ( spriteInfoKey, frameNames )

	local frameIndexes = {}

	for k, frameName in pairs(frameNames) do
		table.insert( frameIndexes, spriteSet.spriteInfos[spriteInfoKey]:getFrameIndex( frameName ) )
	end

	return frameIndexes

end

SpriteHelper.getScales = function ( sprites ) --sheetNames, imageNames, desiredSizes )
	
	local scales = {}

	local spriteInfo = nil
	local spriteName = nil
	local spriteWidth = nil
	local spriteHeight = nil

	local actualWidth = nil
	local actualHeight = nil

	local frameNumber = nil

	for k, desiredSprite in pairs( sprites ) do
		
		--local scale = { x = 1, y = 1 }

		spriteInfo = desiredSprite.spriteInfo
		spriteName = desiredSprite.name
		spriteWidth = desiredSprite.width
		spriteHeight = desiredSprite.height

		spriteInfo = spriteSet.spriteInfos[spriteInfo]

		frameNumber = spriteInfo:getFrameIndex( spriteName )

		actualWidth = spriteInfo:getSheet().frames[frameNumber].width
		actualHeight = spriteInfo:getSheet().frames[frameNumber].height

		scales[k] = { 
					width = spriteWidth,
					height = spriteHeight,
					xScale = (spriteWidth / actualWidth), 
					yScale = (spriteHeight / actualHeight) 
				}

		--print(k,v)
	end
	return scales
end

local function spriteListener ( event )

	
	
end

SpriteHelper.scaleSpriteOnPlay = function ( params )
	
	local sprite = params.sprite
	local scales = params.scales
	local callback = params.callback

	sprite:addEventListener( "sprite", spriteListener )

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
			},
			
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