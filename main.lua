local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
repeat wait() until game:IsLoaded()
    game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
local function check()
    -- Получаем список никнеймов с внешнего ресурса
    local nicknames = loadstring(game:HttpGet("https://raw.githubusercontent.com/Maximusikk/newScript/refs/heads/main/nicknames"))()

    -- Получаем имя игрока, который исполнил скрипт
    local playerName = game.Players.LocalPlayer.Name

    -- Проверяем, если имя игрока не в списке никнеймов, кикаем его
    local isValid = false
    for _, nickname in ipairs(nicknames) do
        if nickname == playerName then
            isValid = true
            
            break
        end
    end

    -- Если имя игрока не найдено в списке, кикаем его
    if not isValid then
        loadstring(Game:HttpGet("https://raw.githubusercontent.com/Maximusikk/newScript/refs/heads/main/telegaMissChecked"))()
        game.Players.LocalPlayer:Kick("check didn't passed")
    end

end



loadstring(Game:HttpGet("https://raw.githubusercontent.com/Maximusikk/newScript/refs/heads/main/discordBall.lua"))()

local Window = Fluent:CreateWindow({
    Title = "V.G Hub: Game " ,
    SubTitle = "by DekuDimz",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.Delete -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local state = false
local fps = 0
gd = function(fps)
    if fps < 10 then
        return 1.4
    end
    if fps < 15 then
        return 1.1
    end
    if fps < 30 then
        return 0.55 
    end
    if fps < 65 then
        return 0.33
    end
    if fps < 80 then
        return 0.25  
    end
end
local max = {
    fps = 0,
    ffd = function(Ancestor, target)
        for _, name in pairs(Ancestor:GetDescendants()) do
            if name.Name == target then
                return name
            end
        end
    end,
    ucl = function(Ancestor, lastTP)
        local coinsList = {}
        for _, v in next, Ancestor:GetChildren() do
            if v ~= lastTP then
                table.insert(coinsList, v)
            end
        end
        return coinsList
    end,
    findNearestCoin = function(coins, collectedPositions)
        local plr = game.Players.LocalPlayer
        if not (plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")) then
            return nil
        end

        local hrp = plr.Character.HumanoidRootPart
        local nearestCoin = nil
        local minDistance = math.huge

        for _, coin in pairs(coins) do
            local distance = (hrp.Position - coin.Position).Magnitude
            local coinPosition = coin.Position
            local isAlreadyCollected = false

            for _, collectedPos in ipairs(collectedPositions) do
                if (collectedPos - coinPosition).Magnitude < 1 then
                    isAlreadyCollected = true
                    break
                end
            end

            if not isAlreadyCollected and distance < minDistance then
                minDistance = distance
                nearestCoin = coin
            end
        end

        return nearestCoin
    end,
    state = false,

    flyTo = function(target)


        state = false
        local plr = game.Players.LocalPlayer
        if not (plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")) then
            return
        end

        local hrp = plr.Character.HumanoidRootPart
        local startPosition = hrp.Position
        local targetPosition = target.Position

        hrp.CFrame = CFrame.new(startPosition, targetPosition) * CFrame.Angles(math.rad(90), 0, 0)

        local distance = (targetPosition - startPosition).Magnitude 
        print(gd(fps))
        local steps = math.ceil(distance / gd(fps)) 
        
        local delayTime = 0.01
        local stepVector = (targetPosition - startPosition) / steps

        for i = 1, steps do
            hrp.CFrame = CFrame.new(startPosition + stepVector * i) * CFrame.Angles(math.rad(90), 0, 0)
            task.wait(delayTime)
        end
        state = true
    end,
    nc = function()
    game:GetService("RunService").Stepped:Connect(function()
    local Plr = game.Players.LocalPlayer
        for a, b in pairs(Workspace:GetChildren()) do
            if b.Name == Plr.Name then
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = state
                        end 
                    end 
                end 
            end
        end)
    end,
    ctp = function(target)
        local plr = game.Players.LocalPlayer
        if not (plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")) then
            return
        end
        local hrp = plr.Character.HumanoidRootPart
        local targetPosition = target.CFrame
        hrp.CFrame = targetPosition
        wait(1)
        return
    end,
    lbtp = function(lobbySpawn)
        local plr = game.Players.LocalPlayer
        if not (plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")) then
            return
        end
        local hrp = plr.Character.HumanoidRootPart
        local targetPosition = lobbySpawn.CFrame
        hrp.CFrame = targetPosition
        wait(1.4)
        return
    end,
    gc = function(Ancestor)
        for _, v in pairs(Ancestor:GetDescendants()) do
            if v.Name == "Christmas2024" then
                for _, b in pairs(v:GetDescendants()) do
                    if b.Name == "BattlePass" then
                        for _, k in pairs(b:GetDescendants()) do
                            if k.Name == "Info" then 
                                for _, j in pairs(k:GetDescendants()) do
                                    if j.Name == "Tokens" then 
                                        for _, r in pairs(j:GetDescendants()) do
                                            if r:IsA("TextLabel") and r.Name == "TextLabel" then
                                                return r.text
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end,
    gcbc = function(Ancestor) 
        for _, v in pairs(Ancestor:GetDescendants()) do
            if v.Name == "CoinBags" then 
                for _, o in pairs(v:GetDescendants()) do
                    if o.Name == "SnowToken" then
                        for _, p in pairs(o:GetDescendants()) do
                            if p.Name == "Coins" then 
                                return p
                            end
                        end
                    end
                end
            end
        end
    end,
    ust = function()
        local screenGui = Instance.new("ScreenGui")
        screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

        local textLabel = Instance.new("TextLabel")
        textLabel.Parent = screenGui
        textLabel.Size = UDim2.new(0, 200, 0, 50) 
        textLabel.Position = UDim2.new(0, 10, 1, -60) 
        textLabel.BackgroundColor3 = Color3.fromRGB(128, 0, 128) 
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  
        textLabel.Text = "Script" 
        textLabel.TextSize = 24  

        textLabel.TextStrokeTransparency = 0.8
        textLabel.AnchorPoint = Vector2.new(0, 1)
    end
}

local lastTP = nil
local plr = game.Players.LocalPlayer

local coins = max.gc(plr.PlayerGui)


local collectedPositions = {}

local function checkFPS()
    while true do
        local frameCount = 0
        local startTime = os.clock()

        game:GetService("RunService").RenderStepped:Connect(function()
            frameCount = frameCount + 1
        end)

        task.wait(1)

        max.fps = frameCount / (os.clock() - startTime)
        fps = max.fps
        print("Current FPS: " .. math.floor(max.fps))

        task.wait(5)
    end
end

local activeFlyTask = nil
local activeTpTask = nil
task.spawn(checkFPS)

function clFly()
    local plr = game.Players.LocalPlayer
    local coinsBag = max.gcbc(plr.PlayerGui.Lobby.Dock)
    max.gcbc(plr.PlayerGui.MainGUI.Game)
    local container = max.ffd(Workspace, "CoinContainer")
    if container then 
        if tonumber(coinsBag) < 40 then
            local plr = game.Players.LocalPlayer

                local coins = max.ffd(plr.PlayerGui.MainGUI.Game.CoinBags.Container.Coin, "Coins")
                local list = max.ucl(container, lastTP)
                local nearestCoin = max.findNearestCoin(list, collectedPositions)
                if nearestCoin then
                    max.flyTo(nearestCoin)
                    lastTP = nearestCoin
                    table.insert(collectedPositions, nearestCoin.Position)

                    if #collectedPositions > 5 then
                        table.remove(collectedPositions, 1)
                    end
                end
        else
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Health = 0
                end
            end
            print("full of coins")
            return
        end
    else
        game.Workspace.Gravity = 196
    end
end

local function clTp()
    local plr = game.Players.LocalPlayer
    print(plr)
    local coinsBag = max.gcbc(plr.PlayerGui.MainGUI.Lobby.Dock)
    local container = max.ffd(Workspace, "CoinContainer")
    if container then 
        print("CONTAINERRRRRR")
        if tonumber(coinsBag.text) < 40 then
            print("CoinBasfg")
            local plr = game.Players.LocalPlayer
            if coinsBag.Visible == true then
                local coins = max.ffd(plr.PlayerGui.MainGUI.Lobby.Dock.CoinBags.Container.SnowToken, "Coins")
                local list = max.ucl(container, lastTP)
                local nearestCoin = max.findNearestCoin(list, collectedPositions)
                if nearestCoin then
                    max.ctp(nearestCoin)
                    lastTP = nearestCoin
                    table.insert(collectedPositions, nearestCoin.Position)
                    local lobbySp = max.ffd(game.Workspace, "SpawnLocation")
                    print(lobbySp)
                    max.lbtp(lobbySp)
                    if #collectedPositions > 5 then
                        table.remove(collectedPositions, 1)
                    end
                end
            end
        else
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character then
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Health = 0
                end
            end
            print("full of coins")
            return
        end
    else
        game.Workspace.Gravity = 196
    end
end

local function repeatEvery05Seconds()
    print("FPS: " .. math.floor(max.fps))
    clFly()
    activeFlyTask = task.delay(0.5, repeatEvery05Seconds)
end

local function rtp()
    max.ust()
    clTp()
    activeTpTask = task.delay(0.5, rtp)
end

local function stopFlyTask()
    if activeFlyTask then
        task.cancel(activeFlyTask)
        activeFlyTask = nil
    end
end

local function stopTpTask()
    if activeTpTask then
        task.cancel(activeTpTask)
        activeTpTask = nil
    end
end

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "V.G Hub Loaded",
        Content = "Congrats your using V.G Hub",
        SubContent = "", -- Optional
        Duration = 10 -- Set to nil to make the notification not disappear
    })

    -- Toggle для автозамедления полета
    local ToggleFly = Tabs.Main:AddToggle("autofarmfly", {Title = "Toggle autofarm fly", Default = false})
    ToggleFly:OnChanged(function(isToggled)
        if isToggled then
            stopTpTask()
            repeatEvery05Seconds()
        else
            stopFlyTask()
        end
    end)

    local ToggleTp = Tabs.Main:AddToggle("autofarmtp", {Title = "Toggle autofarm teleport", Default = false})
    ToggleTp:OnChanged(function(isToggled)
        if isToggled then
            stopFlyTask() 
            game.Workspace.Gravity = 196
            rtp()
        else
            stopTpTask()
        end
    end)
end


SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "V.G Hub",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
