local default_http = require("api.http_client")
local file_manager = require("utils.file_manager")
local task_manager = {
    http = default_http
}

function task_manager.fetch_tasks(project_id)
    local url = "https://zync-pd9r.onrender.com/api/tasks?projectId=" .. project_id
    local response = task_manager.http.request(url, "GET")
    if response.status == 200 then
        file_manager.save_json("tasks_" .. project_id .. ".json", response.body)
        return true
    end
    return false
end

return task_manager
