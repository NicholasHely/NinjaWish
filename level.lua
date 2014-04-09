-----------------------------------------------------------------------------------------
--
-- level1.lua
--
-----------------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- include Corona's "physics" library
local physics = require "physics"
physics.start(); physics.pause()

--------------------------------------------

-- forward declarations and other locals
local screenW, screenH, halfW = display.contentWidth, display.contentHeight, display.contentWidth*0.5


local Player = require ( "player" )
local Balloons = require ( "balloons" )

local Boards = require("boards")

local balloons

local DeltaTime = require("deltaTime");

local player
local boards

local balloonsCount = 0

local SpriteHelper = require("util.spriteHelper")
-----------------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
-- 
-- NOTE: Code outside of listener functions (below) will only be executed once,
--		 unless storyboard.removeScene() is called.
-- 
-----------------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-- create a grey rectangle as the backdrop;[]
	local background = display.newRect( 0, 0, screenW, screenH )
	background:setFillColor( 128 )
	
	SpriteHelper.initialize( { 
		spriteInfos = { main = "images.spritesheet" },
		spriteSheets = { main = "images/spritesheet.png"},
		})

	-- print ( SpriteHelper.getFrameIndexes( "test", { "mapBuild"}))

	-- local sprite = SpriteHelper.newSprite()
	-- sprite:test()

	player = Player:new()

	boards = Boards:new({width = screenW, height = screenH})

	Balloons.player = player

	
	
	-- Shuriken.player = player

	
	

	-- Balloons.group = display.newGroup( )
	-- Balloons.screen = { width = screenW, height = screenH }

	balloons = Balloons:new( )

	-- balloons[1] = Balloon:new( { type = green } )

	-- make a crate (off-screen), position it, and rotate slightly
	-- local crate = display.newImageRect( "crate.png", 90, 90 )
	-- crate.x, crate.y = 160, -100
	-- crate.rotation = 15
	
	-- add physics to the crate
	-- physics.addBody( crate, { density=1.0, friction=0.3, bounce=0.3 } )
	
	-- create a grass object and add physics (with custom shape)
	-- local grass = display.newImageRect( "grass.png", screenW, 82 )
	-- grass:setReferencePoint( display.BottomLeftReferencePoint )
	-- grass.x, grass.y = 0, display.contentHeight
	
	-- define a shape that's slightly shorter than image bounds (set draw mode to "hybrid" or "debug" to see)
	-- local grassShape = { -halfW,-34, halfW,-34, halfW,34, -halfW,34 }
	-- physics.addBody( grass, "static", { friction=0.3, shape=grassShape } )
	
	
	
	-- all display objects must be inserted into group
	group:insert( background )
	group:insert( Balloons.group ) 
	group:insert( Boards.group )
	Player.insertShurikenGroup(group)
	-- group:insert( grass)
	-- group:insert( crate )
	--group:insert( shuriken )
end

local function updateBalloons()



	-- update all the balloons
	for k, balloon in pairs(balloons) do
		balloon:update( )
		-- remove the balloon from the list if it
		-- is finished
		if (balloon.isFinalised == true) then
			balloons[k] = nil
		end
	end
end

local function update ( event )
	
	DeltaTime.updateDeltaTime()
	-- print ("DT: " .. DeltaTime.deltaTime)
	--updateShuriken();
	-- shuriken:setLinearVelocity(20, 20)
	--updateShuriken( )
	player:update( )
	balloons:update( )
	boards:update( )
	--updateBalloons( )
	
	--shuriken:applyTorque( 2 )
end

local function accelerometerChanged(event)  
    player:accelerometerChanged(event)
end  

Runtime:addEventListener("accelerometer", accelerometerChanged) 

-- Called when a new gyroscope measurement has been received.
-- local function onGyroscopeDataReceived( event )
--     -- Calculate approximate rotation traveled via deltaTime.
--     -- Remember that rotation rate is in radians per second.
--     local deltaRadians = event.xRotation * event.deltaTime
--     local deltaDegrees = deltaRadians * (180 / math.pi)
-- end

-- -- Set up the above function to receive gyroscope events if the sensor exists.
-- if system.hasEventSource( "gyroscope" ) then
--     Runtime:addEventListener( "gyroscope", onGyroscopeDataReceived )
-- end

Runtime:addEventListener( "enterFrame", update )

-- local function handleCollision ( event )

-- 	print (event.object1.parentClass.class)

-- 	print ("collision")
-- end

-- Runtime:addEventListener( "collision", handleCollision )

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	physics.start()
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	physics.stop()
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

-- Called when a key event has been received.
local function onKeyEvent( event )
    -- Print which key was pressed down/up to the log.
    local message = "Key '" .. event.keyName .. "' was pressed " .. event.phase
    print( message )
    player.shuriken:handleEvent( event )
    -- If the "back" key was pressed on Android, then prevent it from backing out of your app.
    
end

-- Add the key event listener.
Runtime:addEventListener( "key", onKeyEvent );

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene