function love.load(arg)
    -- Check if testing flag is passed
    if arg then
        for _, val in ipairs(arg) do
            if val == "--test" then
                require("tests.runner")
                return
            end
        end
    end
    print("ZYNC Desktop Loaded")
end
function love.draw()
    love.graphics.print("Welcome to ZYNC Desktop", 400, 300)
end
