local json = require("utils.json")
local file_manager = {}

function file_manager.save_json(filename, data)
    local file = io.open(filename, "w")
    if file then
        file:write(json.encode(data))
        file:close()
        return true
    end
    return false
end

function file_manager.load_json(filename)
    local file = io.open(filename, "r")
    if file then
        local content = file:read("*all")
        file:close()
        return json.decode(content)
    end
    return nil
end

return file_manager
