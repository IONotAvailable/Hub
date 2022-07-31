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

    }
    getgenv().Sliders = {

    }
    getgenv().ACB = {
        Remotes = {},
        Metatable = getrawmetatable(game),
        --Old = getgenv().ACB.Metatable.__namecall,
    }
end

function Runtime.Init()
    -- Set/Reset our global environmental variables.
    Variables()

    -- Run the Anticheat Bypass

    -- Set/Reset the User Interface
    UI.Init()

    -- Set/Reset our Connections
    getgenv().Connections.Stepped = RunService.RenderStepped:Connect(function()
        
    end)
end

return Runtime