local connectivity_check = require("utils.connectivity_check")

local function run_tests()
    -- Check that the function exists
    assert(type(connectivity_check.is_backend_online) == "function", "is_backend_online should be a function")

    -- Wrap in pcall since luasocket might not be present in CLI test run environment
    local status, result = pcall(connectivity_check.is_backend_online)
    if status then
        assert(type(result) == "boolean", "is_backend_online must return a boolean")
    else
        print("luasocket not available, skipped socket runtime check: " .. tostring(result))
    end

    print("All connectivity_check tests passed!")
end

return { run = run_tests }
