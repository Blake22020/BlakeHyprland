local primary = "rgb(b9c3ff)"
local surface = "rgb(121318)"
local secondary = "rgb(c3c5dd)"
local error_color = "rgb(ffb4ab)"

hl.config({
    general = {
        col = { active_border = primary, inactive_border = surface },
    },
    group = {
        col = { border_active = secondary, border_inactive = surface, border_locked_active = error_color, border_locked_inactive = surface },
        groupbar = { col = { active = secondary, inactive = surface, locked_active = error_color, locked_inactive = surface } },
    },
})
