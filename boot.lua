if fs.exists("os.lua") then
    print("os.lua found, loading...")
    os.loadAPI("os.lua")
    os.start()
else
    print("OS not found!")
end