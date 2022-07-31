-- Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Imports
local Module = loadstring(readfile("Modules/Module.lua"))

-- Runtime
local Runtime = {}

local function Variables() 
    getgenv().Stepped = nil
end

local function Init()
    print("Runtime was initialized")
end

Init()