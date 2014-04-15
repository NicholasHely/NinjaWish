local Board = {}




function Board:new( params )
	local board = {}

	board.className = "board"
	board.boardGroup = params.boardGroup
	--board.isOn = false
	board.isContactingPlayer = false
	board.isAlive = true
	board.isFinalised = false
	-- board.time = { 
	-- 	warning = params.time.warning, 
	-- 	lifetime = params.time.lifetime
	-- }
	
	board.display = display.newImage( "images/board.png", params.x, params.y )
	-- board.display.alpha = .55
	board.display.parentClass = board
	--timer.performWithDelay( params.lifetime, board: )
	

	physics.addBody(board.display, "static", { friction = 0.3, density = 1, bounce = 0.2} )

	board.display.gravityScale = 0
	board.display.rotation = params.rotation

	setmetatable( board, self )
	self.__index = self



	return board
end

function Board:isOn()
	return self.boardGroup.isActivated and self.isAlive
end	

function Board:kill()
	self.isAlive = false
	self.display.isSensor = true
	
	print ("board killed")
end



function Board:shurikenHitting()
	self.isContactingPlayer = true
end

function Board:shurikenNotHitting()
	self.isContactingPlayer = false
end

function Board:update()
	
end


return Board