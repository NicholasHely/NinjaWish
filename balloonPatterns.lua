local patterns = {
	[1] = 
	{ 	
		info = 
		{
			width = 2,
			left = 1,
			type = "relative",
		},
		balloonValues = 
		{
			[1] = { type = "green", speed = 1, position = { x = "random", y = 0 } },
			[2] = { type = "green", speed = 1, position = { x = 1, y = 0 } }
		}
	}

}


function getPattern( pattern )

	return patterns[pattern] or patterns[1]

end


