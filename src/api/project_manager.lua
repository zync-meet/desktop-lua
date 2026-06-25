local default_http = require("api.http_client")
local file_manager = require("utils.file_manager")
local project_manager = {
    http = default_http
}

function project_manager.fetch_projects()
    local response = project_manager.http.request("https://zync-pd9r.onrender.com/api/projects", "GET")
    if response.status == 200 then
        file_manager.save_json("projects_cache.json", response.body)
        return true
    end
    return false
end

return project_manager
