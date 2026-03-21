local file_manager = require("utils.file_manager")
local auth_manager = {}

local session_path = "session.json"

function auth_manager.save_token(token)
    return file_manager.save_json(session_path, { token = token })
end

function auth_manager.get_token()
    local session = file_manager.load_json(session_path)
    return session and session.token or nil
end

return auth_manager
