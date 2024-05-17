local url = "https://raw.githubusercontent.com/Ryan-Sutrisno/Build-and-Share/main/chest_monitor.lua"
local response = http.get(url)

if response then
    local script = response.readAll()
    response.close()

    local file = fs.open("chest_monitor.lua", "w")
    file.write(script)
    file.close()

    local startupScript = [[
shell.run("chest_monitor.lua")
]]

    local startupFile = fs.open("startup.lua", "w")
    startupFile.write(startupScript)
    startupFile.close()

    print("Installation complete. Rebooting...")
    os.reboot()
else
    print("Failed to download chest_monitor.lua")
end
