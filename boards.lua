local Boards = {}
local Board = require("board")

Boards.group = display.newGroup( )


function Boards:new( params )
	local boards = {}

	boards.screen = { width = params.width, height = params.height }


	boards.currentBoards = {}

	setmetatable( boards, self )
	self.__index = self



	return boards
end

function Boards:update()

	if (self.currentBoards[1] == nil) then
		self:createBoard( nil )
	end

end

function Boards:createBoard( params )

	local position = { x = 0, y = 0 }

	local board = Board:new( { 
		time = { warning = 1000, lifetime = 10000},
		x = 100,
		y = 100
	}) --display.newImage( "board.png", position.x ,position.y)

	self.currentBoards[1] = board
	table.insert( self.currentBoards, board )

end

return Boards