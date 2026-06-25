local project_manager = require("api.project_manager")
local mocks = require("tests.mocks")
local file_manager = require("utils.file_manager")

local function run_tests()
    local mock_http = mocks.create_http_client()
    project_manager.http = mock_http

    -- Test case 1: Successful fetch
    mock_http.response_body = '[{"id": "p1", "name": "Test project"}]'
    mock_http.response_status = 200
    mock_http.should_fail = false

    local success = project_manager.fetch_projects()
    assert(success == true, "Project fetch failed on successful mock request")
    assert(#mock_http.calls == 1, "Expected exactly 1 HTTP call")
    assert(mock_http.calls[1].method == "GET", "Expected GET request method")
    assert(mock_http.calls[1].url == "https://zync-pd9r.onrender.com/api/projects", "Target URL mismatch")

    -- Verify cache file was written
    local cached = file_manager.load_json("projects_cache.json")
    assert(cached ~= nil, "Cache JSON file was not written or loaded")

    -- Test case 2: Server failure
    mock_http.should_fail = true
    local fail_success = project_manager.fetch_projects()
    assert(fail_success == false, "Project fetch should return false on server error")

    print("All project_manager tests passed!")
end

return { run = run_tests }
