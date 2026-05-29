local colors = (require('themes.catppuccin'))

local mod = "SUPER"
local term = "ghostty"
local fileManager = "thunar"

hl.config({
    decoration = {
        blur = {
            enabled = true,
            passes = 3,
            size = 6,
        },

        shadow = {
            color = colors.base,
            enabled = true,
            range = 4,
            render_power = 3,
        },
        active_opacity = 1.000000,
        inactive_opacity = 1.000000,
        rounding = 8,
    },
    dwindle = {
        preserve_split = true,
        smart_split = true,
    },
    general = {
        border_size = 2,
        col = {
            active_border = colors.blue,
            inactive_border = colors.base,
        },
        gaps_in = 5,
        gaps_out = 10,
        layout = "dwindle",
    },
    master = {
        new_status = "master",
    },
    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
    },
    xwayland = {
        enabled = true,
    },
    animations = {
        enabled = true;
    }
})

hl.on("hyprland.start", function()
    hl.exec_cmd("1password --silent")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("jetbrains-toolbox --minimize")
    hl.exec_cmd("xrandr --output DP-2 --primary")
    hl.exec_cmd("dropbox start")
end)

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("NIXOS_OZONE_WL", "1")

hl.monitor({ output = "DP-1", mode = "1920x1080@164.92", position = "4480x0", scale = 1 })
hl.monitor({ output = "DP-2", mode = "2560x1440@180.00", position = "1920x0", scale = 1 })
hl.monitor({ output = "DP-3", mode = "1920x1080@164.92", position = "0x0", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "1920x1080@60.00", position = "0x1080", scale = 1 })

hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(term))
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind(mod .. " + S", hl.dsp.exec_cmd("dms screenshot --no-file"))
hl.bind(mod .. " + N", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(mod .. " + L", hl.dsp.window.swap({direction = "r"}))
hl.bind(mod .. " + H", hl.dsp.window.swap({direction = "l"}))
hl.bind(mod .. " + K", hl.dsp.window.swap({direction = "u"}))
hl.bind(mod .. " + J", hl.dsp.window.swap({direction = "d"}))
hl.bind(mod .. " + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind(mod .. " + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind(mod .. " + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind(mod .. " + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind(mod .. " + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind(mod .. " + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind(mod .. " + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind(mod .. " + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind(mod .. " + 9", hl.dsp.focus({ workspace = "9" }))
hl.bind(mod .. " + V", hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(mod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = "1" }))
hl.bind(mod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = "2" }))
hl.bind(mod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = "3" }))
hl.bind(mod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = "4" }))
hl.bind(mod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = "5" }))
hl.bind(mod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = "6" }))
hl.bind(mod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = "7" }))
hl.bind(mod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = "8" }))
hl.bind(mod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = "9" }))
hl.bind(mod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + SHIFT + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mod .. " + SHIFT + Z", hl.dsp.exec_cmd("dms ipc call lock lock"))
hl.bind(mod .. " + CTRL + S", hl.dsp.exec_cmd("dms ipc call settings toggle"))
hl.bind(mod .. " + CTRL + Q", hl.dsp.exit())
hl.bind("ALT + TAB", hl.dsp.layout("cyclenext"))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true, locked = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.drag(), { mouse = true })

hl.window_rule({ name = "float-vol-control", match = { title = "(.*Volume Control$)" }, center = true, float = true, size = "600 800" })
hl.window_rule({ name = "terminal-workspace", match = { class = "(.*ghostty)" }, workspace = 1 })
hl.window_rule({ name = "discord-workspace", match = { class = "(.*discord)" }, workspace = 2 })
hl.window_rule({ name = "slack-workspace", match = { class = "(.*Slack)" }, workspace = 2 })
hl.window_rule({ name = "zen-workspace", match = { class = "(.*zen-twilight)" }, workspace = 3 })
hl.window_rule({ name = "brave-workspace", match = { class = "(.*Brave)" }, workspace = 3 })
hl.window_rule({ name = "Spotify-workspace", match = { class = "(.*Spotify)" }, workspace = 4 })
hl.window_rule({ name = "steam-workspace", match = { class = "(steam)" }, workspace = 5 })
hl.window_rule({ name = "steam-game-workspace", match = { title = "(steam.*)" }, workspace = 5 })
hl.window_rule({ name = "chrome-workspace", match = { title = "(.*Google Chrome)" }, workspace = 6 })

hl.workspace_rule({ workspace = "1", monitor = "DP-2" })
hl.workspace_rule({ workspace = "2", monitor = "DP-3" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1" })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "5", monitor = "DP-2" })
hl.workspace_rule({ workspace = "6", monitor = "DP-2" })
hl.workspace_rule({ workspace = "7", monitor = "DP-2" })
hl.workspace_rule({ workspace = "8", monitor = "DP-2" })
hl.workspace_rule({ workspace = "9", monitor = "DP-2" })

hl.curve("slight_bounce", { type = "spring", mass = 1, stiffness = 35, dampening = 10 })

hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 1, spring = "slight_bounce" })--, style = "popin 90%" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1, spring = "slight_bounce" })
