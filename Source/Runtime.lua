-- Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Imports
local Module = dofile("xGamer626Parkour/Modules/Module.lua")
print(Module.H)

-- Runtime
local Runtime = {}

local function Variables() 
    getgenv().Stepped = nil
end

function Runtime.Init()
    print("Runtime was initialized")
end

return Runtime