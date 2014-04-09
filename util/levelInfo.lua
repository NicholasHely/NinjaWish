
local width = 1100
local height = 700

local dimensions = {
	
	left = (display.contentWidth - width) / 2,
	right = display.contentWidth - (display.contentWidth - width) / 2,

	top = (display.contentHeight - height) / 2,
	bottom = display.contentHeight - (display.contentHeight - height) / 2,
	width = width,
	height = height
}

local levelInfo = {}

levelInfo.dimensions = dimensions

return levelInfo