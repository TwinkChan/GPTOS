print("Starting boot sequence...")
if fs.exists("os.lua") then
    print("os.lua found, loading...")
    local success, err = pcall(os.loadAPI, "os.lua")
    if not success then
        print("Failed to load os.lua:", err)
        return
    end
    os.start()
else
    print("OS not found!")
end