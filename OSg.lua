local termWidth, termHeight = term.getSize()

local function drawMainScreen(files)
    term.setBackgroundColor(colors.black)
    term.clear()
    term.setTextColor(colors.white)
    term.setCursorPos(1, 1)
    print("Files and Folders:")
    for i, file in ipairs(files) do
        term.setCursorPos(2, i + 2)
        print("- " .. file.name)
    end
end

local function drawContextMenu(x, y, options)
    term.setBackgroundColor(colors.gray)
    term.setTextColor(colors.white)
    term.setCursorPos(x, y)
    for i, option in ipairs(options) do
        term.setCursorPos(x, y + i - 1)
        print(option)
    end
end

local function handleUserInput()
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        if button == 1 then
            if x == termWidth and y == 1 then
                drawContextMenu(x, y, {"Option 1", "Option 2", "Option 3"})
            else
                print("Left click at x=" .. x .. ", y=" .. y)
            end
        elseif button == 2 then
            if x == termWidth and y == 1 then
                drawContextMenu(x, y, {"Option A", "Option B", "Option C"})
            else
                print("Right click at x=" .. x .. ", y=" .. y)
            end
        elseif button == 1 and x == termWidth and y == 1 then
            drawContextMenu(x, y, {"Option 1", "Option 2", "Option 3"})
        end
    end
end

local function main()
    local files = {
        {name = "File1.txt", type = "file"},
        {name = "Folder1", type = "folder"},
        {name = "File2.txt", type = "file"},
        {name = "File3.txt", type = "file"},
        {name = "Folder2", type = "folder"},
        {name = "File4.txt", type = "file"},
    }

    drawMainScreen(files)

    handleUserInput()
end

main()