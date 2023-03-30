local sword = {
    "rbxassetid://8698443433";
    "rbxassetid://8699014368";
    "rbxassetid://9255163830";
    "rbxassetid://9215215492";
    "rbxassetid://8779280417";
    "rbxassetid://9112351440";
}
local fist = {
    "rbxassetid://9890788066";
    "rbxassetid://9890790186";
    "rbxassetid://9890792365";
    "rbxassetid://9890796934";
    "rbxassetid://9891303051";
    "rbxassetid://10558610693";
}
local guns = {
    "rbxassetid://10206784771";
    "rbxassetid://10206804975";
    "rbxassetid://10206765261";
}
local dagger = {
    "rbxassetid://10300203796";
    "rbxassetid://10300357869";
    "rbxassetid://10307611102";
    "rbxassetid://10571560499";
}
local battleaxe = {
    "rbxassetid://10013909049";
    "rbxassetid://10013911426";
    "rbxassetid://10013915154";
    "rbxassetid://10013909049";
    "rbxassetid://10013911426";
    "rbxassetid://10013915154";
    "rbxassetid://10013919534";
    "rbxassetid://9112351440";
}
local squibbo = {
    "rbxassetid://10085445723";
    "rbxassetid://10085688428";
    "rbxassetid://10085695929";
}
local mudskipper = {
    "rbxassetid://10109623939";
    "rbxassetid://10109628136";
}
local primadon = {
    "rbxassetid://9145238578";
    "rbxassetid://9137450354";
}
local primadond = {
    "rbxassetid://9145941681";
    "rbxassetid://9148987428";
    "rbxassetid://9147807267";
}
local crits = {
    "rbxassetid://9892586559"; -- katana
    "rbxassetid://9890800691"; -- fist
    "rbxassetid://8787495611"; -- sword
    "rbxassetid://10310816773"; -- dagger
}
local axecrit = "rbxassetid://10022838306"
local sing = "rbxassetid://10369504335"
local vent = "rbxassetid://10968567648"

local feint = false
local plr = game.Players.LocalPlayer
local char = plr.Character
local runService = game:GetService("RunService")
local mouse = plr:GetMouse()
local UIS = game:GetService("UserInputService")
_G.aptoggle = false
_G.m1hold = false
_G.cancelparry = false
_G.aelitahighlight = false
_G.trollmode = false

function m1()
    game:GetService("Players").LocalPlayer.Character.CharacterHandler.M1:FireServer("Down")
    game:GetService("Players").LocalPlayer.Character.CharacterHandler.M1:FireServer("Up")
end

function roll()
    keypress(0x51)
    keyrelease(0x51)
    mouse2click()
    
end

function parry()
    if not feint and char:FindFirstChild("CharacterHandler") and _G.trollmode == false then
        game:GetService("Players").LocalPlayer.Character.CharacterHandler:FindFirstChild("F"):FireServer("Down")
        game:GetService("Players").LocalPlayer.Character.CharacterHandler:FindFirstChild("F"):FireServer("Up")
    end
    if _G.trollmode == true then
        wait(0.1)
        roll()
    end
end

function aelitahighlight()
    for i,v in pairs(workspace.Characters:GetChildren()) do
        if v:FindFirstChild("Ears") then
            if v:FindFirstChild("Highlight") then return end
            highlight = Instance.new("Highlight", v)
            highlight.Adornee = v
        end
    end
end

function m1hold()
    while _G.m1hold == true do
        wait(0.1)
        mouse.Button1Down:Connect(function()
            holding = true
        end)
        mouse.Button1Up:Connect(function()
            holding = false
        end)
        while holding == true do
            wait(0.1)
            m1()
        end
    end
end

function cancelparry()
    while _G.cancelparry == true do
        wait(0.2)
        
    end
end

function autoparry()
    while _G.aptoggle == true do
            wait(0.1)
            char = plr.Character
            runService.RenderStepped:Wait()
            for i, plrChar in next, workspace.Characters:GetChildren() do
                if plrChar ~= char and plrChar:FindFirstChild("Humanoid") and plrChar.Humanoid.Health > 0 and plrChar:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("HumanoidRootPart") then
                    local anims = plrChar.Humanoid:GetPlayingAnimationTracks()
                    for _, anim in next, anims do
                        if table.find(sword, anim.Animation.AnimationId) then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 15 then
                                anim.Stopped:Connect(function()
                                    feint = true
                                end)
                                wait(0.225)
                                parry()
                                wait()
                                feint = false
                            end
                        end
                        if table.find(fist, anim.Animation.AnimationId) then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 15 then
                                anim.Stopped:Connect(function()
                                    feint = true
                                end)
                                wait(0.10)
                                parry()
                                feint = false
                            end
                        end
                        if table.find(guns, anim.Animation.AnimationId) then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 15 then
                                anim.Stopped:Connect(function()
                                    feint = true
                                end)
                                wait(0.075)
                                parry()
                                feint = false
                            end
                        end
                        if table.find(dagger, anim.Animation.AnimationId) then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 15 then
                                anim.Stopped:Connect(function()
                                            feint = true
                                end)
                                if char:FindFirstChild("GlidedKnife") then
                                    wait(0.075)
                                else
                                    wait(0.15)
                                end
                                parry()
                                feint = false
                            end
                        end
                        if table.find(battleaxe, anim.Animation.AnimationId) then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 20 then
                                anim.Stopped:Connect(function()
                                    feint = true
                                end)
                                wait(0.25)
                                parry()
                                wait(0.1)
                                feint = false
                            end
                        end
                        -- monsters
                        if table.find(squibbo, anim.Animation.AnimationId) then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 20 then
                                anim.Stopped:Connect(function()
                                    feint = true
                                end)
                                wait(0.15)
                                parry()
                                wait(0.5)
                                feint = false
                            end
                        end
                        if table.find(mudskipper, anim.Animation.AnimationId) then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 20 then
                                anim.Stopped:Connect(function()
                                    feint = true
                                end)
                                wait(0.15)
                                parry()
                                wait(0.1)
                                feint = false
                            end
                        end
                        -- special
                        if table.find(crits, anim.Animation.AnimationId) then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 15 then
                                wait(0.4)
                                parry()
                                wait(0.5)
                            end
                        end
                        if anim.Animation.AnimationId == "rbxassetid://9912709174" then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 15 then
                                anim.Stopped:Connect(function()
                                    feint = true
                                end)
                                wait(0.25)
                                parry()
                                feint = false
                            end
                        end
                        if anim.Animation.AnimationId == sing then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 25 then
                                roll()
                            end
                        end
                        if anim.Animation.AnimationId == axecrit then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 15 then
                                anim.Stopped:Connect(function()
                                    feint = true
                                end)
                                wait(0.50)
                                parry()
                                feint = false
                            end
                        end
                        if anim.Animation.AnimationId == vent then
                            if (plrChar.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude <= 10 then
                                roll()
                            end
                        end
                    end
                end    
            end
    end
end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "fakewoken 3",
    LoadingTitle = "Rayfield Interface Suite",
    LoadingSubtitle = "by RBLOKO",
    KeySystem = false -- Set this to true to use our key system
})
local fakewoken = Window:CreateTab("fakewoken 3", 8350658333)
local Autoparry = fakewoken:CreateSection("Autoparry")

local APToggle = fakewoken:CreateToggle({
    Name = "Toggle AP",
    CurrentValue = false,
    Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(AutoParryToggle)
        _G.aptoggle = AutoParryToggle
        autoparry()
    end
    })
local TrollToggle = fakewoken:CreateToggle({
    Name = "Toggle AP Troll mode 😈😈",
    CurrentValue = false,
    Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(APTrollToggle)
        _G.trollmode = APTrollToggle
    end
    })

local Other = fakewoken:CreateSection("Other")
local M1HoldToggle = fakewoken:CreateToggle({
    Name = "Toggle M1 Hold",
    CurrentValue = false,
    Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(M1Hold)
        _G.m1hold = M1Hold
        m1hold()
    end
    })

local HighlightAelita = fakewoken:CreateButton({
    Name = "Click to highlight real aelita",
    Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(AelitaHighlight)
        aelitahighlight()
    end
    })

local Buggy = fakewoken:CreateSection("Buggy")

local RollCD = fakewoken:CreateButton({
    Name = "Click to remove roll cooldown (cant lvl up)",
    Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(RollCDButton)
        local old
        old = hookfunction(wait, newcclosure(function(...)
           return old()
        end))
        local balls
        balls= hookfunction(task.wait, newcclosure(function(...)
           return balls()
        end))
    end
    })

local NoCd = fakewoken:CreateKeybind({
    Name = "Press to remove cd from skills",
    CurrentKeybind = "G",
    HoldToInteract = false,
    Flag = "Bind1",
    Callback = function(NoCdBind)
        for i in pairs(game.workspace.Characters[game.Players.LocalPlayer.Character.Name]:GetDescendants()) do
                local args = {
                    [1] = "Cancel",
                    [2] = {
                        ["Instance"] = workspace:WaitForChild("floor"),
                        ["Normal"] = Vector3.new(0, 1, 0),
                        ["Position"] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(0, 15, 0)
                    }
                }
                
                game:GetService("Players").LocalPlayer.Character:FindFirstChild("stop exploiting, " .. game.Players.LocalPlayer.Character.Name).RemoteEvent:FireServer(unpack(args))
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:WaitForChild("RollCancel"):Destroy()
                for i, v in pairs(game.workspace.floor:GetChildren()) do
                    if v.Name == "Attachement" then
                       v:Destroy() 
                    end
                end
        end
    end
})