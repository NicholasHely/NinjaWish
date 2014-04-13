
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

local shurikenTimeAcrossScreen = 40
local balloonMaxTimeAcrossScreen = 120
local balloonStartTimeAcrossScreen = 400

local speeds = {
	shuriken = { maxY = dimensions.height / shurikenTimeAcrossScreen,
		maxX = dimensions.width / shurikenTimeAcrossScreen},
	balloon = {
		startY = -(dimensions.height / balloonStartTimeAcrossScreen),
		endY = -(dimensions.height / balloonMaxTimeAcrossScreen)
	} 

}



local levelInfo = {}

levelInfo.dimensions = dimensions
levelInfo.speeds = speeds

function levelInfo:calculateSpeed( timeAcrossScreen )
	return levelInfo
end

return levelInfo