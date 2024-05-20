if fs.exists("os.lua") then
    os.loadAPI("os.lua")
    os.start()
else
    print("OS not found!")
end