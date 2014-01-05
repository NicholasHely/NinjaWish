local patterns = {
	[1] = 
	{ 
		
		{ type = "green", position = { x = "random", y = 0 } }
	
	}

}


function getPattern( pattern )

	return patters[pattern] or 
	{ 
		{ 
		type = "green", position = { x = "random", y = 0 }
		}
	}

end


