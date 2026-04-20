local theme = require("ui.theme")
local components = require("ui.components")
local dashboard = {}

function dashboard.draw()
    love.graphics.setBackgroundColor(theme.background)
    love.graphics.setColor(theme.foreground)
    love.graphics.print("ZYNC Desktop Dashboard", 40, 40)
    
    -- Draw sample project cards
    components.draw_card(40, 100, 300, 150)
    love.graphics.setColor(theme.foreground)
    love.graphics.print("Zync Android Client", 60, 120)
end

return dashboard
