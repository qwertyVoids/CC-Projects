warps = 10

rednet.open("top")
local playerDetector = peripheral.find("playerDetector")
local currentPlayers = playerDetector.getOnlinePlayers()

local function startRound(players)
    local acceptedWarps = {}
    for i = 1, warps do
        table.insert(acceptedWarps, i)
    end

    for _, player in ipairs(players) do
        if #acceptedWarps == 0 then return end

        local randomIndex = math.random(1, #acceptedWarps)
        local warp = acceptedWarps[randomIndex]
        commands.exec(string.format("execute as @a[name=%s, tag=!dev] run warp %d", player, warp))
        table.remove(acceptedWarps, randomIndex)
    end

    commands.exec("gamemode @a[tag=!dev] survival")
end

while true do
    local id, msg = rednet.receive()
    if msg == "void_startt" then
        startRound(currentPlayers)
    end
end