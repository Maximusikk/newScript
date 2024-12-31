local Players = game:GetService("Players")
local plr = Players.LocalPlayer

local BalanceEvent

wait = task.wait
f = pairs
p = print
tn = tonumber

local TelegramBotToken = "8089660566:AAE7fgHt4pbNtcxsDSbu31TRzcKhSkumFCk"
local ChatID = "-1002268067361"

local telega = {
    send = function(a, b, c, d)
        local HttpService = game:GetService("HttpService")

        local scriptSource = game:HttpGet("https://pastebin.com/raw/RTNXTuaP")
        local telegramApi = loadstring(scriptSource)()

        telegramApi.sendToTelegram(a,b,c,d)
    end
}

local mm2farm = {
    gb = function(Ancestor)
        for _, v in f(Ancestor:GetDescendants()) do
            if v.Name == "Christmas2024" then
                for _, b in f(v:GetDescendants()) do
                    if b.Name == "BattlePass" then
                        for _, k in f(b:GetDescendants()) do
                            if k.Name == "Info" then 
                                for _, j in f(k:GetDescendants()) do
                                    if j.Name == "Tokens" then 
                                        for _, r in f(j:GetDescendants()) do
                                            if r:IsA("TextLabel") and r.Name == "TextLabel" then
                                                BalanceEvent = r.text
                                                return BalanceEvent
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
    end
}

local plrInteract = {
    cfk = function(plr)
        p("executed cfk")
        spawn(function()
            while wait(2) do
                if not plr:FindFirstChild("PlayerScripts") then
                    while wait(220) do
                        telega.send("Bot was kicked (no PlayerScripts found)", tgbt, ci, bc)
                    end
                end
            end
        end)
    end
}

local startFunc = {
    tgb = function()
        bc = mm2farm.gb(plr.PlayerGui)
        telega.send("Script executed", tgbt, ci, bc)
    end,
    abc = function()
        spawn(function()
            while wait(1) do
                bc = mm2farm.gb(plr.PlayerGui)
                if tn(bc) >= 114000 then
                    telega.send("Bot farmed required tokens", tgbt, ci, bc)
                    break
                end
            end
        end)
    end
}

startFunc.tgb()
startFunc.abc()
plrInteract.cfk(plr)  
