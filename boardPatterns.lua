local patterns = {
	[1] = 
	{ 	
		info = 
		{
			warningTime = 2000,
			lifetime = 10000,
			blocks = 10,
		},
		pattern = 
		{
			[1] = { 
				x = 500, y = 75, height = 20, width = 20, rotation = 0
				},
			[2] = { 
				x = 100, y = 100, height = 20, width = 20, rotation = 10 
				},
			
		}
	}

}

local function getPattern( pattern )

	return patterns[pattern] or patterns[1]

end

local Patterns = {}
Patterns.getPattern = getPattern

return Patterns;


