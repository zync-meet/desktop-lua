local auth_manager = require("api.auth_manager")

local function run_tests()
    local test_token = "zync_test_session_token_12345"

    -- Save token
    local saved = auth_manager.save_token(test_token)
    assert(saved == true, "Auth token save failed")

    -- Load token
    local loaded = auth_manager.get_token()
    assert(loaded == test_token, "Auth token loaded mismatch")

    -- Clean up session file
    os.remove("session.json")

    print("All auth_manager tests passed!")
end

return { run = run_tests }
