warps = 10

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
        commands.exec(string.format("execute as %s run warp %d", player, warp))
        table.remove(acceptedWarps, randomIndex)
    end
end

startRound(currentPlayers)