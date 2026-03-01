warps = 10

local playerDetector = peripheral.find("playerDetector")
local acceptedWarps = {}
for i = 1, warps do
    table.insert(acceptedWarps, i)
end

local players = playerDetector.getOnlinePlayers()
for _, player in ipairs(players) do
    local warp = acceptedWarps[math.floor(math.random(1, #acceptedWarps))]
    commands.exec(string.format("execute as %s run warp %d"), player, warp)
    table.remove(acceptedWarps, table.find(acceptedWarps, warp))
end