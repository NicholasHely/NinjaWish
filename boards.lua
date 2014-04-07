local Boards = {}
local Board = require("board")
local Patterns = require ("boardPatterns")

Boards.group = display.newGroup( )
Boards.timing = { warning = 2000, lifetime = 10000 }

function Boards:new( params )
	local boards = {}

	setmetatable( boards, self )
	self.__index = self

	boards.screen = { width = params.width, height = params.height }

	boards.boardGroups = {}
	
	--boards.boardGroup = {}
	--boards.boardGroup.boards = {}
	

	

	boards:createBoards()

	return boards
end

local function onTimerEnd( event )

	if ( event.source.params.isActivated == false ) then
		event.source.params.isWarningOver = true
		print ("warning over")
	else
		print ("board over")
		event.source.params.isAlive = false

		for k, board in pairs(event.source.params.boards) do
			board:kill()
			--print(k,v)
		end

	end
end

local function activateBoardGroup( boardGroup )
	boardGroup.isActivated = true
	boardGroup.displayGroup.alpha = 1
	local tm = timer.performWithDelay( boardGroup.timing.lifetime, onTimerEnd )
	tm.params = boardGroup

end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
function Boards:update()


	for k, boardGroup in pairs(self.boardGroups) do
		if (boardGroup.isActivated == false and 
			boardGroup.isWarningOver == true) then

			local isPlayerContacting = false
			for boardKey, board in pairs(boardGroup.boards) do
				print("I have a board")
				if (board.isContactingPlayer == true) then
					isPlayerContacting = true
					break
				end
			end

			if (isPlayerContacting == false) then
				activateBoardGroup( boardGroup )
			end

		end

		
		-- print(k,v)
	end
	
	-- if (self.currentBoards[1] == nil) then
	-- 	self:createBoard( nil )
	-- end

end

function Boards:createBoards()
	local boardPattern = Patterns.getPattern(1)

	local group = {}
	group.displayGroup = display.newGroup( )

	group.boards = {  }

	local board = self:createBoard( { boardGroup = group } )
	
	table.insert(group.boards, board)
	group.displayGroup:insert(board.display)

	group.timing = { warning = boardPattern.info.warningTime, lifetime = boardPattern.info.lifetime }

	group.isWarningOver = false
	group.isActivated = false
	-- group.isTouchingPlayer = false
	
	local tm = timer.performWithDelay( group.timing.warning, onTimerEnd )
	tm.params = group
	group.displayGroup.alpha = .55

	Boards.group:insert(group.displayGroup)

	table.insert(self.boardGroups, group)

end

function Boards:createBoard( params )

	local position = { x = 0, y = 0 }

	local board = Board:new( { 
		boardGroup = params.boardGroup,
		time = { warning = 1000, lifetime = 10000},
		x = 100,
		y = 100
	}) --display.newImage( "board.png", position.x ,position.y)
	return board
	-- self.currentBoards[1] = board
	-- table.insert( self.boardGroup.boards, board )

end

return Boards