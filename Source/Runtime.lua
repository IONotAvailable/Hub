-- Services
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

-- Imports
-- local Module = import(readfile("xGamer626Parkour/Modules/Module.lua"))
-- print(Module)
print("A")

-- Runtime
local Runtime = {
    Variables = {
        getgenv().Stepped = nil,
    },
}

function Runtime:Init()
    print("Runtime was initialized.")
end

return Runtime