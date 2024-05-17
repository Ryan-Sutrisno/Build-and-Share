-- chest_monitor.lua
function print_inventory_on_monitor(chest, monitor)
    if not chest or not monitor then
        print("Chest or monitor not found!")
        return
    end

    monitor.clear()
    monitor.setCursorPos(1, 1)

    local items = chest.list()
    for slot, item in pairs(items) do
        local displayName = item.name:gsub("minecraft:", "")
        local line = string.format("%dx %s", item.count, displayName)
        monitor.write(line)
        monitor.setCursorPos(1, select(2, monitor.getCursorPos()) + 1)
    end
end

--- De while loop om elke 10 seconden de monitor te updaten
while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("minecraft:chest")

    print_inventory_on_monitor(chest, monitor)

    sleep(10)
end
