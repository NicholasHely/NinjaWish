--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:c794cd45a5464aa3e51419f5ba9ad761:1/1$
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
            x=2,
            y=438,
            width=32,
            height=32,

        },
        {
            -- mapPath
            x=2,
            y=404,
            width=32,
            height=32,

        },
        {
            -- sprite1
            x=2,
            y=2,
            width=600,
            height=400,

        },
        {
            -- sprite2
            x=2,
            y=438,
            width=32,
            height=32,

        },
    },
    
    sheetContentWidth = 1024,
    sheetContentHeight = 512
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
