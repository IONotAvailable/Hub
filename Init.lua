-- Services
local HttpService = game:GetService("HttpService")

-- Variables
local Version = game

-- Functions
local function Import_Files()
    -- Check for folder.
    if isfolder("xGamer626Parkour") then
        -- If there is a folder then remove it to update it to current version.
        delfolder("xGamer626Parkour")
    end

    -- Make the folders.
    makefolder("xGamer626Parkour")
    makefolder("xGamer626Parkour/Modules")
    makefolder("xGamer626Parkour/Source")

    -- Make the files.
    writefile("xGamer626Parkour/Source/Runtime.lua", game:HttpGetAsync("https://raw.githubusercontent.com/xgamerman626/Hub/main/Source/Runtime.lua?token=GHSAT0AAAAAABXEWDOSBBDXLPWEYWGTKZLYYXGBDEA"))

    -- Write to the files.
end

local function Init()
    Import_Files()
end

-- Main
Init()