os = {}

function os.start()
    if not fs.exists("gui.lua") then
        print("GUI not found!")
        return
    end
    
    os.loadAPI("gui")
    gui.start()
end

function os.loadAPI(api)
    local env = {}
    setmetatable(env, { __index = _G })
    local func, err = loadfile(api .. ".lua")
    if func then
        setfenv(func, env)
        func()
        _G[api] = env
    else
        print("Error loading API:", err)
    end
end