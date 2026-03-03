rednet.open("back")

os.run({}, "/rom/programs/clear.lua")
write("Press G to start")

while true do
    local event, key = os.pullEvent("key")
    if keys.getName(key) == "g" then
        rednet.send("void_startt")
        os.run({}, "/rom/programs/clear.lua")
        term.setTextColor(colors.red)
        write("Wait 10 sec.")
        os.sleep(10)
        term.setTextColor(colors.white)
        write("Press G to start")
    end
end