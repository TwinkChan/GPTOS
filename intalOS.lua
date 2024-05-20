local function getFromGitHub(url, filename)
    local response = http.get(url)
    if response then
        local file = fs.open(filename, "w")
        file.write(response.readAll())
        file.close()
        print("Downloaded", filename)
    else
        print("Failed to download", filename)
    end
end

local files = {
    {url = "https://raw.githubusercontent.com/TwinkChan/GPTOS/main/boot.lua", filename = "boot.lua"},
    {url = "https://raw.githubusercontent.com/TwinkChan/GPTOS/main/fs.lua", filename = "fs.lua"},
    {url = "https://raw.githubusercontent.com/TwinkChan/GPTOS/main/gui.lua", filename = "gui.lua"},
    {url = "https://raw.githubusercontent.com/TwinkChan/GPTOS/main/os.lua", filename = "os.lua"},
    {url = "https://raw.githubusercontent.com/TwinkChan/GPTOS/main/textedit.lua", filename = "textedit.lua"}
}

for _, file in ipairs(files) do
    getFromGitHub(file.url, file.filename)
end