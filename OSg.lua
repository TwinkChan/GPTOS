local items = {
    {name = "Folder1", type = "folder"},
    {name = "File1.txt", type = "file"},
    {name = "Folder2", type = "folder"},
    {name = "File2.txt", type = "file"}
}

local function drawWindowFrame()
    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.black)
    term.clear()
    term.setCursorPos(1, 1)
    term.write("My Computer")
    term.setCursorPos(1, 2)
    term.write(string.rep("-", term.getSize()))
    term.setCursorPos(1, 3)
    term.write("|")
    term.setCursorPos(1, 4)
    term.write(string.rep("-", term.getSize()))
    term.setCursorPos(1, term.getHeight())
    term.write(string.rep("-", term.getSize()))
end

local function drawFilesAndFolders()
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
    for i, item in ipairs(items) do
        term.setCursorPos(3, i + 3)
        if item.type == "folder" then
            term.setTextColor(colors.blue)
            term.write("[" .. item.name .. "]")
        else
            term.setTextColor(colors.black)
            term.write(item.name)
        end
    end
end

local function drawContextMenu(x, y)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
    term.setCursorPos(x, y)
    term.clearLine()
    term.write("Open")
    term.setCursorPos(x, y + 1)
    term.clearLine()
    term.write("Rename")
    term.setCursorPos(x, y + 2)
    term.clearLine()
    term.write("Copy")
    term.setCursorPos(x, y + 3)
    term.clearLine()
    term.write("Delete")
end

local function main()
    drawWindowFrame()
    drawFilesAndFolders()

    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        if button == 2 then
            drawContextMenu(x, y)
            os.pullEvent("mouse_click")
            drawFilesAndFolders()
        end
    end
end

main()