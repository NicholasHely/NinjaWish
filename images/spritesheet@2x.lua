--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ef392b02b706e2cd00cc856644efb79f:1/1$
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
            -- mapBuild
            x=4,
            y=876,
            width=64,
            height=64,

        },
        {
            -- mapPath
            x=4,
            y=808,
            width=64,
            height=64,

        },
        {
            -- sprite1
            x=4,
            y=4,
            width=1200,
            height=800,

        },
        {
            -- sprite2
            x=4,
            y=876,
            width=64,
            height=64,

        },
    },
    
    sheetContentWidth = 2048,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{

    ["mapBuild"] = 1,
    ["mapPath"] = 2,
    ["sprite1"] = 3,
    ["sprite2"] = 4,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
