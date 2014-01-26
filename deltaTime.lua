

local runtime = 0

local data = {}
data.deltaTime = 1

function data.updateDeltaTime()
	local temp = system.getTimer()  --Get current game time in ms
   --local dt = (temp-runtime) / (1000/60)  --60fps or 30fps as base
	data.deltaTime = (temp-runtime) / (1000/30)
	runtime = temp  --Store game time
	
	-- return dt
end



return data

