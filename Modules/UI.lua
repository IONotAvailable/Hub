local UI = {}

-- Variables
local Library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Parkour by xgamer626#1683", HidePremium = true})

local Combo_Tab = Window:MakeTab({
	Name = "Combo",
	Icon = "rbxassetid://3152629358",
	PremiumOnly = false
})

local Movement_Tab = Window:MakeTab({
	Name = "Movement",
	Icon = "rbxassetid://3152629574",
	PremiumOnly = false
})

local Audio_Tab = Window:MakeTab({
	Name = "Audio",
	Icon = "rbxassetid://9743254397",
	PremiumOnly = false
})

local Cola_Tab = Window:MakeTab({
	Name = "Cola",
	Icon = "rbxassetid://9743223064",
	PremiumOnly = false
})

local Adrenaline_Tab = Window:MakeTab({
	Name = "Adrenaline",
	Icon = "rbxassetid://9744692070",
	PremiumOnly = false
})

local Misc_Tab = Window:MakeTab({
	Name = "Miscellaneous",
	Icon = "rbxassetid://9405931578",
	PremiumOnly = false
})

local Automatic_Tab = Window:MakeTab({
	Name = "Automatic",
	Icon = "rbxassetid://9742968183",
	PremiumOnly = false
})

local Notifcations_Tab = Window:MakeTab({
	Name = "Notifcations",
	Icon = "rbxassetid://9745241351",
	PremiumOnly = false
})

-- Main
function UI.Init()
    Combo_Tab:AddToggle({
        Name = "Set Flow",
        Default = false,
        Callback = function(Value)

        end    
    })
    
    Combo_Tab:AddToggle({
        Name = "Set Combo",
        Default = false,
        Callback = function(Value)

        end    
    })
    
    Combo_Tab:AddSlider({
        Name = "Combo Level",
        Min = 1,
        Max = 5,
        Default = 1,
        Color = Color3.fromRGB(255,255,255),
        Increment = 1,
        ValueName = nil,
        Callback = function(Value)

        end    
    })
    
    
    Movement_Tab:AddToggle({
        Name = "Ammo Reset",
        Default = false,
        Callback = function(Value)

        end    
    })
    
    Movement_Tab:AddBind({
        Name = "Ammo Reset",
        Default = Enum.KeyCode.F,
        Hold = false,
        Callback = function()

        end    
    })
    
    Movement_Tab:AddBind({
        Name = "Slide Speed",
        Default = Enum.KeyCode.C,
        Hold = false,
        Callback = function()

        end    
    })
    
    Movement_Tab:AddSlider({
        Name = "Slide Speed",
        Min = 1,
        Max = 1000,
        Default = 1,
        Color = Color3.fromRGB(255,255,255),
        Increment = 5,
        ValueName = nil,
        Callback = function(Value)

        end    
    })
    
    
    Adrenaline_Tab:AddToggle({
        Name = "Inf Adrenaline",
        Default = false,
        Callback = function(Value)

        end    
    })
    
    Misc_Tab:AddButton({
        Name = "Unlock Spawns",
        Callback = function()

        end
    })
    
    Misc_Tab:AddButton({
        Name = "Unlock Badges",
        Callback = function()
    
        end
    })
    
    Misc_Tab:AddToggle({
        Name = "God Mode",
        Default = false,
        Callback = function(Value)

        end    
    })
    
    Misc_Tab:AddToggle({
        Name = "Anti Dunce",
        Default = false,
        Callback = function(Value)

        end    
    })
    
    Misc_Tab:AddToggle({
        Name = "Anti Trail",
        Default = false,
        Callback = function(Value)
           
        end    
    })
    
    Notifcations_Tab:AddToggle({
        Name = "Staff Notifier",
        Default = true,
        Callback = function(Value)
            
        end    
    })
    
    Audio_Tab:AddToggle({
        Name = "No Wind",
        Default = false,
        Callback = function(Value)
            
        end    
    })
    
    Automatic_Tab:AddButton({
        Name = "Herbal Run",
        Callback = function()
            
        end
    })
    
    Automatic_Tab:AddButton({
        Name = "The Arch",
        Callback = function()
            
        end
    })
    
    Automatic_Tab:AddButton({
        Name = "Vertex Tower",
        Callback = function()
            
        end
    })
    
    
    Cola_Tab:AddLabel("WIP")
    Audio_Tab:AddLabel("WIP")
end

-- Return
return UI