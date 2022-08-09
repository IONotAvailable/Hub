-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")

-- Imports
local UI = loadstring(readfile("xGamer626Parkour/Modules/UI.lua"))()
local ACB = loadstring(readfile("xGamer626Parkour/Modules/ACB.lua"))()

-- Runtime
local Runtime = {}

-- Locals
local Player = Players.LocalPlayer
local PlayerGui = Player.PlayerGui

function Variables()
    if getgenv().Activated == true then
        pcall(function()
            getgenv().Connections.Stepped_RunService:Disconnect()
            getgenv().Connections.Staff_Notifcation:Disconnect()
            getgenv().Connections.Player_Notifcation:Disconnect()
        end)
    end

    getgenv().Activated = true
    getgenv().GameVariables = nil
    getgenv().Connections = {
        Input_Began = nil,
        Stepped_RunService = nil,
        Staff_Notifcation = nil,
        Player_Notifcation = nil,
    }
    getgenv().Toggles = {
        -- Audio

        -- Cola

        -- Automatic

        -- Wingsuit

        -- Paraglider

        -- Magrail
        Infinite_Magrail = false,

        -- Grappler
        Infinite_Grappler = false,

        -- Adrenaline
        Infinite_Adrenaline = false,

        -- Combo
        Flow_Active = false,
        Combo_Level = false,

        -- Gearless
        Infinite_Wallrun = false,
        Infinite_Wallboost = false,
        Infinite_Charge = false,
        Auto_CatchZipline = false,
        Ammo_Reset = false,
        Slide_Speed = false,

        -- Misc
        God_Mode = false,
        Anti_Trail = false,
        Anti_Dunce = false,

        -- Notifcations
        Staff_Notifications = false,
        Player_Notifications = false,
        Bag_Notifications = false,
    }
    getgenv().Sliders = {
        Slide_Speed = 1,
        Combo_Level = 1,
    }
    getgenv().ACB = {
        BanRemotes = {
            "LoadString",
            "HighCombo",
            "FF",
            "SubmitCombo",
            "UpdateCombo",
            "LowCombo",
            "FinishTimeTrial",
            "UpdateDunceList",
        },
        Remotes = {},
    }
    getgenv().Other = {
        Stimmed = false,
        CanZipline = true,
    }
end


function Runtime.Init()
    -- Set/Reset our global environmental variables.
    Variables()

    task.wait(.1)

    -- Run the Anticheat Bypass
    ACB.Init()

    -- Set/Reset the User Interface
    UI.Init()

    -- Set/Reset our Connections
    getgenv().Connections.Stepped_RunService = RunService.RenderStepped:Connect(function()
        -- Only run this step if player exists
        if Player.Character:FindFirstChild("Humanoid") then
            -- Assign the games main variables to a global variable
            getgenv().GameVariables = getupvalue(getsenv(Player.Backpack:WaitForChild("Main")).resetAmmo, 1)

            -- Main toggling stuff
            if getgenv().Toggles.Anti_Dunce == true then
                -- This just bypasses client sided things that check if you're dunced. (NOT SERVER)
                local Shares = getrenv().shared
                Shares.dunces[Player.Name] = false
            end

            if getgenv().Toggles.Combo_Level == true then
                getgenv().GameVariables.comboTime = 1000
                getgenv().GameVariables.comboHealth = 100
                getgenv().GameVariables.comboXp = 1
                getgenv().GameVariables.comboLevel = getgenv().Sliders.Combo_Level
            end

            if getgenv().Toggles.Flow_Active == true then
                getgenv().GameVariables.flowActive = true;
                getgenv().GameVariables.flowDelta = 100;
            end

            if getgenv().Toggles.Slide_Speed == true then
                getgenv().GameVariables.slidespeed = getgenv().Sliders.Slide_Speed
            end

            if getgenv().Toggles.Infinite_Wallboost == true then
                getgenv().GameVariables.numWallclimb = math.huge
                getgenv().GameVariables.lastWallClimb = 0
            end

            if getgenv().Toggles.Infinite_Charge == true then
                getgenv().GameVariables.chargeCooldown = 0
            else
                getgenv().GameVariables.chargeCooldown = 2
            end

            local Zipline_Text = PlayerGui.GameplayUI.Zipline
            local Zipline_Keybind = ReplicatedStorage.PlayerData[Player.Name].Settings.Keybinds.E
            local Shift_Keybind = ReplicatedStorage.PlayerData[Player.Name].Settings.Keybinds.Shift
            -- so cancer lol
            if getgenv().Toggles.Auto_CatchZipline == true then
                if getgenv().GameVariables.ziplining == false then
                    if Zipline_Text.Visible == true then
                        if Player.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                            if getgenv().Other.CanZipline == true then
                                task.spawn(function()
                                    getgenv().Other.CanZipline = false
                                    VirtualInputManager:SendKeyEvent(true, Shift_Keybind.Value, false, game)
                                    task.wait(0.05)
                                    VirtualInputManager:SendKeyEvent(true, Zipline_Keybind.Value, false, game)
                                    task.wait(.05)
                                    VirtualInputManager:SendKeyEvent(false, Shift_Keybind.Value, false, game)
                                    VirtualInputManager:SendKeyEvent(false, Zipline_Keybind.Value, false, game)
                                end)
                            end
                        end
                    end
                end
            end

            if Player.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
                -- Only reset the debounce if they're on the floor
                if getgenv().GameVariables.ziplining == false then
                    task.delay(1, function()
                        getgenv().Other.CanZipline = true 
                    end)
                end
            end

        end
    end)

    getgenv().Connections.Input_Began = UserInputService.InputBegan:Connect(function(Input, Game_Processed)
        local Back_Gear_Key = Player.PlayerGui.NewUI.Windows.Keybinds.Window.UseKit.Binding

        if Input.KeyCode == Enum.KeyCode[Back_Gear_Key.Text] and not Game_Processed then
            if getgenv().Toggles.Infinite_Adrenaline == false then 
                getgenv().Other.Stimmed = false
                return 
            else
                if getgenv().Other.Stimmed == true then
                    -- Unstim
                    getgenv().Other.Stimmed = false
                    getgenv().GameVariables.adrenalineCooldown = 30
                elseif getgenv().Other.Stimmed == false then
                    -- Stim
                    getgenv().Other.Stimmed = true
                    task.wait(.2) -- Wait a tiny second for the animiation to play
                    getgenv().GameVariables.adrenalineCooldown = math.huge
                end
            end
        end   
    end)
end

return Runtime