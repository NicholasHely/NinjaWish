--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:97521af67da8bf05d69ffdfeca166972:1/1$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- sprite1
            x=8,
            y=8,
            width=1200,
            height=800,

        },
        {
            -- sprite2
            x=8,
            y=888,
            width=64,
            height=64,

        },
        {
            -- sprite3
            x=8,
            y=816,
            width=64,
            height=64,

        },
        {
            -- sprite4
            x=8,
            y=888,
            width=64,
            height=64,

        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["sprite1"] = 1,
    ["sprite2"] = 2,
    ["sprite3"] = 3,
    ["sprite4"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
