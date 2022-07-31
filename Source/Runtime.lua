-- Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Imports
local UI = dofile("xGamer626Parkour/Modules/UI.lua")
local ACB = dofile("xGamer626Parkour/Modules/ACB.lua")

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
end

function Runtime.Init()
    -- Set/Reset our global environmental variables.
    Variables()

    -- Set/Reset our Connections
    getgenv().Connections.Stepped = RunService.RenderStepped:Connect(function()
        
    end)
end

return Runtime