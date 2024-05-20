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
    {url = "https://raw.githubusercontent.com/TwinkChan/GPTOS/main/OSg.lua", filename = "OSg.lua"},
}

for _, file in ipairs(files) do
    getFromGitHub(file.url, file.filename)
end