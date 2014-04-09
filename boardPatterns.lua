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
				blocks = 10,
				initialPosition = { xStart = 50, yStart = 25, xEnd = 100, yEnd = 80, width = .05 },
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


