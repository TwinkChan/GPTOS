os = {}

function os.start()
    if not fs.exists("gui.lua") then
        print("GUI not found!")
        return
    end
    
    os.loadAPI("gui.lua")
    gui.start()
end

function os.loadAPI(api)
    local env = setmetatable({}, { __index = _G })
    local func, err = loadfile(api, env)
    if func then
        func()
        for k, v in pairs(env) do
            _G[k] = v
        end
    else
        print("Error loading API:", err)
    end
end
