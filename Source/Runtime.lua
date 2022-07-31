-- Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Imports


-- Runtime
local Runtime = {
    Variables = {
        getgenv().Stepped = nil,
    },
}

local function Init()
    print("Runtime was initialized")
end

Init()