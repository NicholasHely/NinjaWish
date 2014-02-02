local Board = {}




function Board:new( params )
	local board = {}

	board.className = "board"
	board.isOn = false
	board.isContactingPlayer = false

	board.time = { 
		warning = params.time.warning, 
		lifetime = params.time.lifetime
	}
	
	board.display = display.newImage( "images/board.png", params.x, params.y )
	board.display.alpha = .55
	board.display.parentClass = board
	--timer.performWithDelay( params.lifetime, board: )
	

	physics.addBody(board.display, "static", { friction = 0.3, density = 1, bounce = 0.2} )

	board.display.gravityScale = 0

	setmetatable( board, self )
	self.__index = self



	return board
end

function Board:update()



end


return Board