local patterns = {
	[1] = 
	{ 	
		info = 
		{
			width = 2,
			left = 1,
			--type = "relative",
		},
		balloonValues = 
		{
			[1] = { type = "green", speed = 1, position = { type = "random", x = nil, y = 0 } },
			[2] = { type = "green", speed = 1, position = { type = "relative", x = 1, y = 0 } }
		}
	}

}




function getPattern( pattern )

	return patterns[pattern] or patterns[1]

end


