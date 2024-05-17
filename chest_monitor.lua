local chest = peripheral.find("minecraft:chest")
local monitor = peripheral.find("monitor")

if chest == nil then
    print("No chest found")
    return
end

if monitor == nil then
    print("No monitor found")
    return
end

local width, height = monitor.getSize()
local Y = math.floor((height - 2 * #chest.list()) / 2)

monitor.clear()
monitor.setCursorPos(1, 1)

for slot, item in pairs(chest.list()) do
    local itemDetail = chest.getItemDetail(slot)
    if itemDetail ~= nil then
        local xPos = math.floor((width - #itemDetail.displayName) / 2)
        monitor.setCursorPos(xPos, Y)
        monitor.write(itemDetail.displayName)

        local quantityPos = math.floor((width - #tostring(itemDetail.count)) / 2)
        monitor.setCursorPos(quantityPos, Y + 1)
        monitor.write(tostring(itemDetail.count))

        Y = Y + 2
    end
end