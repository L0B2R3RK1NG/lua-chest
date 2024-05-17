local url = "https://raw.githubusercontent.com/L0B2R3RK1NG/lua-chest/main/chest_monitor.lua"
local chestMonitor = "chest_monitor.lua"
shell.run("wget", url, chestMonitor)

local startupPath = "startup.lua"
local startupCode = [[shell.run("]] .. chestMonitor .. [[")]]
local file = fs.open(startupPath, "w")
file.write(startupCode)
file.close()

print("Geinstalleerd!")
