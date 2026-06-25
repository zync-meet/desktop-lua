local test_file_manager = require("tests.test_file_manager")
local test_project_manager = require("tests.test_project_manager")
local test_auth_manager = require("tests.test_auth_manager")
local test_connectivity_check = require("tests.test_connectivity_check")

print("==================================================")
print("ZYNC Desktop (Lua) Phased Unit Tests Runner")
print("==================================================")

local suites = {
    { name = "FileManager persistence tests", suite = test_file_manager },
    { name = "ProjectManager API tests", suite = test_project_manager },
    { name = "AuthManager session tests", suite = test_auth_manager },
    { name = "ConnectivityCheck socket tests", suite = test_connectivity_check }
}

local passed = 0
local failed = 0

for _, item in ipairs(suites) do
    print("Running Suite: " .. item.name .. "...")
    local ok, err = pcall(item.suite.run)
    if ok then
        print("✓ " .. item.name .. " PASSED\n")
        passed = passed + 1
    else
        print("❌ " .. item.name .. " FAILED")
        print("Error: " .. tostring(err) .. "\n")
        failed = failed + 1
    end
end

print("==================================================")
print("Test Run Summary:")
print("Passed: " .. passed)
print("Failed: " .. failed)
print("==================================================")

-- Clean up any test files left
os.remove("test.json")
os.remove("projects_cache.json")

if failed > 0 then
    os.exit(1)
else
    os.exit(0)
end
