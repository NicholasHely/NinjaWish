--calculate the aspect ratio of the device
local aspectRatio = display.pixelHeight / display.pixelWidth
local height = aspectRatio < 1.5 and 1200 or math.ceil( 800 * aspectRatio )
local width = aspectRatio > 1.5 and 800 or math.ceil( 1200 / aspectRatio )


application = {
    content = {
        width = aspectRatio > 1.5 and 800 or math.ceil( 1200 / aspectRatio ),
        height = aspectRatio < 1.5 and 1200 or math.ceil( 800 * aspectRatio ),
        
        fps = 30,
        scale = "letterBox",
         
        imageSuffix =
        {
            ["@2x"] = 1.3,
            ["@4x"] = 1.8,
        },
     
   },
}

-- application = {
    -- content = {
        -- width = 320,
        -- height = 480, 
        -- scale = "letterBox",
        -- fps = 30,
        
        -- [[
        -- imageSuffix = {
            -- ["@2x"] = 2,
        -- }
        -- ]]
    -- },

   -- [[
   -- Push notifications

    -- notification =
    -- {
        -- iphone =
        -- {
            -- types =
            -- {
                -- "badge", "sound", "alert", "newsstand"
            -- }
        -- }
    -- }
   -- ]]    
-- }
