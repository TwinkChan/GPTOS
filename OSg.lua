local mainMenu = {
    "File",
    "Edit",
    "View",
    "Options",
    "Help"
}

local contextMenu = {
    "Open",
    "Rename",
    "Copy",
    "Delete"
}

local function drawMainScreen()
    term.setBackgroundColor(colors.blue)
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor(colors.white)
    for i, option in ipairs(mainMenu) do
        term.setCursorPos(1, i)
        print(option)
    end
end

local function drawContextMenu(x, y)
    term.setBackgroundColor(colors.gray)
    term.setTextColor(colors.white)
    for i, option in ipairs(contextMenu) do
        term.setCursorPos(x, y + i - 1)
        print(option)
    end
end

local function handleMouseClick(x, y)
    if x == 1 then
        drawContextMenu(x, y)
    end
end

local function main()
    drawMainScreen()

    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        handleMouseClick(x, y)
    end
end

main()