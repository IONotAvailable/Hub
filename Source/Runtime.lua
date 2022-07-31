-- Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Imports
local Module = import(readfile("xGamer626Parkour/Modules/Module.lua"))
print(Module)

-- Runtime
local Runtime = {
    Variables = {
        getgenv().Stepped = nil,
    },
}

-- Setting up RenderStepped
-- Runtime.Variables.Stepped = RunService.RenderStepped:Connect(function(Step)

-- end)
