local theme = require("ui.theme")
local ui = {}

function ui.draw_card(x, y, w, h)
    love.graphics.setColor(theme.card)
    love.graphics.rectangle("fill", x, y, w, h, 8, 8)
    love.graphics.setColor(theme.border)
    love.graphics.rectangle("line", x, y, w, h, 8, 8)
end

return ui
