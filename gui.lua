gui = {}

local term = term

function gui.start()
    term.clear()
    term.setCursorPos(1, 1)
    print("Starting SimpleGUI...")

    gui.drawWindow(5, 5, 20, 10, "Example Window")
    
    while true do
        local event, param1, param2, param3 = os.pullEvent()
        if event == "mouse_click" then
            gui.handleClick(param2, param3)
        end
    end
end

function gui.drawWindow(x, y, width, height, title)
    term.setBackgroundColor(colors.gray)
    term.setTextColor(colors.white)
    
    for i = 0, height - 1 do
        term.setCursorPos(x, y + i)
        term.write(string.rep(" ", width))
    end

    term.setCursorPos(x + math.floor((width - #title) / 2), y)
    term.write(title)
end

function gui.handleClick(x, y)
    print("Clicked at: " .. x .. ", " .. y)
end