fs = {}

function fs.list()
    local files = fs.list("/")
    for _, file in ipairs(files) do
        print(file)
    end
end
