-- Main
local ACB = {}

function ACB.Init()

    local RandomLocalLuaSourceContainer
    for _, Script in pairs(getscripts()) do
        if (Script.ClassName == 'LocalScript' or Script.ClassName == 'ModuleScript') and Script:IsDescendantOf(game.Players.LocalPlayer) then
            RandomLocalLuaSourceContainer = Script
            break
        end
    end
    
    -- Detect the hidden remote events and store them inside a table
    local ScriptEnv = getsenv(RandomLocalLuaSourceContainer)
    local ScriptEnvIndexMethod = rawget(getrawmetatable(ScriptEnv), '__index')
    local TriggerPointsFunc = rawget(rawget(ScriptEnvIndexMethod, 'shared'), 'triggerPointsFunction')

    if TriggerPointsFunc and type(TriggerPointsFunc) == 'function' then
        local FuncTable
        for _, Table in pairs(debug.getupvalues(TriggerPointsFunc)) do
            if type(Table) == 'table' and rawget(Table, 'statAdd') then
                FuncTable = Table
                break
            end
        end
    
        if FuncTable then
            for Name, Func in pairs(FuncTable) do
                for _, Remote in pairs(debug.getupvalues(Func)) do
                    if Remote.ClassName == 'RemoteEvent' then
                        getgenv().ACB.Remotes[Name] = Remote
                        break
                    end
                end
            end
        end
    end

end

-- Return
return ACB