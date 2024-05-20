local args = {...}
local fileName = args[1]

if not fileName then
    print("Usage: textedit <filename>")
    return
end

local content = ""
if fs.exists(fileName) then
    local file = fs.open(fileName, "r")
    content = file.readAll()
    file.close()
end

term.clear()
term.setCursorPos(1, 1)
print("Editing: " .. fileName)
print(content)

term.setCursorPos(1, 3)
local newText = read()

local file = fs.open(fileName, "w")
file.write(newText)
file.close()

print("File saved.")