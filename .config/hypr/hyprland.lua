-- Hyprland 0.56+ configuration.
local mainMod = "SUPER"

hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@60", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "1920x1080@60", position = "2560x345", scale = 1 })

local startup = {
    "noctalia",
    "lxqt-policykit-agent",
    "swaync",
    "wl-paste --watch cliphist store",
    "awww-daemon && awww img ~/Pictures/wall.jpg --transition-type any",
    "hypridle -c ~/.config/hypr/hypridle.conf",
    "sleep 2 && /usr/lib/hyprpolkitagent/hyprpolkitagent",
    "hyprctl setcursor Bibata-Modern-Classic 24",
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",
}
for _, command in ipairs(startup) do
    hl.on("hyprland.start", function() hl.exec_cmd(command) end)
end

for key, value in pairs({
    XDG_SESSION_TYPE = "wayland", XDG_CURRENT_DESKTOP = "Hyprland", XDG_SESSION_DESKTOP = "Hyprland",
    TERMINAL = "ghostty", XCURSOR_THEME = "Bibata-Modern-Classic", XCURSOR_SIZE = "24",
    HYPRCURSOR_THEME = "Bibata-Modern-Classic", HYPRCURSOR_SIZE = "24", MOZ_ENABLE_WAYLAND = "1",
    QT_QPA_PLATFORMTHEME = "qt6ct", QT_ICON_THEME = "Adwaita", GTK_ICON_THEME = "Adwaita",
    XDG_ICON_THEME = "Adwaita", QT_STYLE_OVERRIDE = "Fusion",
}) do hl.env(key, value) end

hl.config({
    general = { gaps_in = 5, gaps_out = 10, border_size = 1, resize_on_border = true, allow_tearing = false, layout = "dwindle" },
    decoration = {
        rounding = 16, rounding_power = 2, active_opacity = 1, inactive_opacity = 0.8,
        blur = { enabled = false, size = 8, passes = 2, ignore_opacity = true, new_optimizations = true, xray = false },
        shadow = { enabled = true, range = 8, render_power = 4, color = "rgba(00000088)" },
    },
    input = { kb_layout = "us,ru", kb_options = "grp:alt_shift_toggle", follow_mouse = 1, touchpad = { natural_scroll = true, tap_to_click = true, drag_lock = true } },
})

hl.window_rule({ name = "float pavucontrol", match = { class = "pavucontrol" }, float = true })
hl.window_rule({ name = "float file progress", match = { title = "FIle Operation Progress" }, float = true })
hl.window_rule({ name = "opacity global", match = { class = "^(.*)$" }, opacity = "0.8 0.6" })

hl.layer_rule({
    name = "noctalia panels",
    match = { namespace = "^(noctalia-bar-.*|noctalia-dock)$" },
    no_anim = true,
})

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

local function bind(key, dispatcher) hl.bind(mainMod .. " + " .. key, dispatcher) end
local function exec(key, command) bind(key, hl.dsp.exec_cmd(command)) end

exec("RETURN", "ghostty"); bind("Q", hl.dsp.window.close()); exec("E", "nautilus"); bind("F", hl.dsp.window.fullscreen({ mode = "maximized" }))
exec("D", "noctalia msg panel-toggle launcher"); exec("P", "noctalia msg plugin alexander/screen-toolkit:service all toggle")
exec("X", "noctalia msg panel-toggle control-center"); exec("ESCAPE", "noctalia msg panel-toggle session")
exec("comma", "noctalia msg settings-toggle"); exec("Tab", "noctalia msg window-switcher"); exec("SPACE", "hyprctl switchxkblayout next")
exec("S", "codium ~/.config/hypr"); exec("B", "firefox"); exec("Z", "zen-browser"); exec("C", "claude-desktop"); exec("Y", "spotify")
exec("T", "env LD_LIBRARY_PATH=/home/blake/.local/lib/ayugram DESKTOPINTEGRATION=1 AyuGram -- %U"); exec("O", "obsidian"); exec("A", "antigravity"); exec("R", "QT_STYLE_OVERRIDE=breeze happ")
for key, direction in pairs({ H = "l", L = "r", K = "u", J = "d" }) do bind(key, hl.dsp.focus({ direction = direction })); bind("SHIFT + " .. key, hl.dsp.window.move({ direction = direction })) end
for i = 1, 8 do bind(tostring(i), hl.dsp.focus({ workspace = i })); bind("SHIFT + " .. i, hl.dsp.window.move({ workspace = i })) end
hl.bind("ALT + Tab", hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" })); hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }); hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
for key, command in pairs({ XF86AudioRaiseVolume = "noctalia msg volume-up", XF86AudioLowerVolume = "noctalia msg volume-down", XF86AudioMute = "noctalia msg volume-mute", XF86MonBrightnessUp = "noctalia msg brightness-up", XF86MonBrightnessDown = "noctalia msg brightness-down", XF86AudioPlay = "playerctl play-pause", XF86AudioNext = "playerctl next", XF86AudioPrev = "playerctl previous" }) do hl.bind(key, hl.dsp.exec_cmd(command)) end
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window")); hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
bind("SHIFT + R", hl.dsp.exec_cmd("hyprctl reload")); bind("V", hl.dsp.window.float())

require("hyprcolors")
require("animations")
require("noctalia")
