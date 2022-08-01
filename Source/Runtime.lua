-- Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Imports
local UI = loadstring(readfile("xGamer626Parkour/Modules/UI.lua"))()
local ACB = loadstring(readfile("xGamer626Parkour/Modules/ACB.lua"))()


-- Runtime
local Runtime = {}

function Variables()
    getgenv().Connections = {
        Stepped = nil,
        Staff_Notifcation = nil,
        Player_Notifcation = nil,
    }
    getgenv().Toggles = {
        Infinite_Wallboost = false,
        Infinite_Magrail = false,
        Infinite_Grappler = false,
        Infinite_Adrenaline = false,

        Flow_Active = false,
        Combo_Level = false,

        Ammo_Reset = false,
        Slide_Speed = false,

        God_Mode = false,
        Anti_Trail = false,
        Anti_Dunce = false,

        Staff_Notifications = false,
        Player_Notifications = false,
    }
    getgenv().Sliders = {
        Slide_Speed = 1,
        Combo_Level = 1,
    }
    getgenv().ACB = {
        Remotes = {},
        Metatable = getrawmetatable(game),
        --Old = getgenv().ACB.Metatable.__namecall,
    }
    getgenv().Other = {
        Stimmed = false,
    }
end

function Runtime.Init()
    -- Set/Reset our global environmental variables.
    Variables()

    -- Run the Anticheat Bypass
    ACB.Init()

    -- Set/Reset the User Interface
    UI.Init()

    -- Set/Reset our Connections
    getgenv().Connections.Stepped = RunService.RenderStepped:Connect(function()
        
    end)
end

return Runtime