local items = {
    {name = "Folder1", type = "folder"},
    {name = "File1.txt", type = "file"},
    {name = "Folder2", type = "folder"},
    {name = "File2.txt", type = "file"}
}

local function drawMainScreen()
    term.setBackgroundColor(colors.blue)
    term.clear()
    term.setCursorPos(1, 1)
    term.setTextColor(colors.white)
    for i, item in ipairs(items) do
        term.setCursorPos(1, i)
        print(item.name)
    end
end

local function drawContextMenu(x, y)
    term.setBackgroundColor(colors.gray)
    term.setTextColor(colors.white)
    for i, option in ipairs({"Open", "Rename", "Copy", "Delete"}) do
        term.setCursorPos(x, y + i - 1)
        print(option)
    end
end

local function handleMouseClick(x, y, button)
    if button == 2 then
        drawContextMenu(x, y)
    end
end

local function main()
    drawMainScreen()

    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        handleMouseClick(x, y, button)
    end
end

main()
