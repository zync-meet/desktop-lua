local file_manager = require("utils.file_manager")

local function run_tests()
    local test_data = { name = "Test Project", desc = "Hello" }
    assert(file_manager.save_json("test.json", test_data) == true, "Save failed")
    local loaded = file_manager.load_json("test.json")
    assert(loaded ~= nil, "Load failed")
    print("All file_manager tests passed!")
end

return { run = run_tests }
