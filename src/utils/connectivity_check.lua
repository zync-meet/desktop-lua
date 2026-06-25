local socket = require("socket")
local connectivity_check = {}

function connectivity_check.is_backend_online()
    -- Attempt to open a socket connection to Render backend api
    local connection = socket.tcp()
    connection:settimeout(2) -- 2 seconds timeout
    local success, err = connection:connect("zync-pd9r.onrender.com", 80)
    if success then
        connection:close()
        return true
    else
        return false
    end
end

return connectivity_check
