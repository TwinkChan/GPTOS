os = {}

function os.start()
    print("Starting OS...")
    if not fs.exists("gui.lua") then
        print("GUI not found!")
        return
    end
    
    local success, err = pcall(os.loadAPI, "gui")
    if not success then
        print("Failed to load gui.lua:", err)
        return
    end
    
    print("GUI loaded, starting GUI...")
    gui.start()
end

function os.loadAPI(api)
    print("Loading API: " .. api)
    local env = {}
    setmetatable(env, { __index = _G })
    local func, err = loadfile(api .. ".lua")
    if func then
        print("API loaded: " .. api)
        setfenv(func, env)
        func()
        _G[api] = env
    else
        print("Error loading API:", err)
    end
end