------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal      = "kitty"
local fileManager   = "nautilus"
local menu          = "rofi -show drun -show-icons"
local window_switch = "rofi -show window"
local bright_up     = "brightnessctl s 10%+"
local bright_down   = "brightnessctl s 10%-"
-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waypaper --restore --random")
    hl.exec_cmd("/usr/lib/pam_kwallet_init")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("NVD_BACKEND", "direct")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 1,

        col = {
            active_border = {
                colors = {
                    "rgba(89b4faee)",
                    "rgba(cba6f7ee)"
                },
                angle = 45
            },

            inactive_border = "rgba(45475aaa)",
        },

        resize_on_border = true,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.85,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1e1e2eee)",
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.12,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },

    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            natural_scroll = false,
        },
    },

    ecosystem = {
        enforce_permissions = true,
    },
})

--------------------
---- ANIMATIONS ----
--------------------

hl.curve("easeOutQuint", {
    type = "bezier",
    points = {
        {0.23, 1},
        {0.32, 1},
    }
})

hl.curve("easeInOutCubic", {
    type = "bezier",
    points = {
        {0.65, 0.05},
        {0.36, 1},
    }
})

hl.curve("linear", {
    type = "bezier",
    points = {
        {0, 0},
        {1, 1},
    }
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {
        {0.5, 0.5},
        {0.75, 1.0},
    }
})

hl.curve("quick", {
    type = "bezier",
    points = {
        {0.15, 0},
        {0.1, 1},
    }
})

hl.animation({
    leaf    = "global",
    enabled = true,
    speed   = 10,
    bezier  = "default",
})

hl.animation({
    leaf    = "border",
    enabled = true,
    speed   = 5.39,
    bezier  = "easeOutQuint",
})

hl.animation({
    leaf    = "windows",
    enabled = true,
    speed   = 4.79,
    bezier  = "easeOutQuint",
})

hl.animation({
    leaf    = "windowsIn",
    enabled = true,
    speed   = 4.1,
    bezier  = "easeOutQuint",
    style   = "popin 87%",
})

hl.animation({
    leaf    = "windowsOut",
    enabled = true,
    speed   = 1.49,
    bezier  = "linear",
    style   = "popin 87%",
})

hl.animation({
    leaf    = "fadeIn",
    enabled = true,
    speed   = 1.73,
    bezier  = "almostLinear",
})

hl.animation({
    leaf    = "fadeOut",
    enabled = true,
    speed   = 1.46,
    bezier  = "almostLinear",
})

hl.animation({
    leaf    = "fade",
    enabled = true,
    speed   = 3.03,
    bezier  = "quick",
})

hl.animation({
    leaf    = "layers",
    enabled = true,
    speed   = 3.81,
    bezier  = "easeOutQuint",
})

hl.animation({
    leaf    = "layersIn",
    enabled = true,
    speed   = 4,
    bezier  = "easeOutQuint",
    style   = "fade",
})

hl.animation({
    leaf    = "layersOut",
    enabled = true,
    speed   = 1.5,
    bezier  = "linear",
    style   = "fade",
})

hl.animation({
    leaf    = "fadeLayersIn",
    enabled = true,
    speed   = 1.79,
    bezier  = "almostLinear",
})

hl.animation({
    leaf    = "fadeLayersOut",
    enabled = true,
    speed   = 1.39,
    bezier  = "almostLinear",
})

hl.animation({
    leaf    = "workspaces",
    enabled = true,
    speed   = 1.94,
    bezier  = "almostLinear",
    style   = "fade",
})

hl.animation({
    leaf    = "workspacesIn",
    enabled = true,
    speed   = 1.21,
    bezier  = "almostLinear",
    style   = "fade",
})

hl.animation({
    leaf    = "workspacesOut",
    enabled = true,
    speed   = 1.94,
    bezier  = "almostLinear",
    style   = "fade",
})

---------------
---- INPUT ----
---------------

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd(bright_up),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd(bright_down),
    { locked = true, repeating = true }
)
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd(window_switch))

hl.bind(
    mainMod .. " + H",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy")
)

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Screenshots
hl.bind(
    mainMod .. " + SHIFT + P",
    hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots")
)

-- Focus movement
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end

-- Workspace scrolling
hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)

-- Mouse binds
hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

-- Audio / brightness
hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl s 10%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl s 10%-"),
    { locked = true, repeating = true }
)

-- Media keys
hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Floating rules
hl.window_rule({
    name  = "ida-float",
    match = {
        class = "^(com.hex_rays.IDA.pro._9_3)$"
    },

    float = true,
})

hl.window_rule({
    name  = "emulator-float",
    match = {
        class = "^(Emulator)$"
    },

    float = true,
})

-- Picture-in-picture rules
hl.window_rule({
    name = "pip-float",
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
    },

    float = true,
})

hl.window_rule({
    name = "pip-keep-aspect",
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
    },

    keep_aspect_ratio = true,
})

hl.window_rule({
    name = "pip-move",
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
    },

    move = "73% 72%",
})

hl.window_rule({
    name = "pip-pin",
    match = {
        title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$"
    },

    pin = true,
})

-- Opacity rules
hl.window_rule({
    name = "vscode-opacity",
    match = {
        class = "^([Cc]ode)$"
    },

    opacity = "0.90 0.80",
})

hl.window_rule({
    name = "kitty-opacity",
    match = {
        class = "^(kitty)$"
    },

    opacity = "0.80 0.80",
})

hl.window_rule({
    name = "discord-opacity",
    match = {
        class = "^(discord)$"
    },

    opacity = "0.95 0.80",
})

-- Float common apps
local float_classes = {
    "mpv",
    "kvantummanager",
    "qt5ct",
    "qt6ct",
    "nwg-look",
    "org.kde.ark",
    "org.pulseaudio.pavucontrol",
    "blueman-manager",
    "nm-applet",
    "nm-connection-editor",
    "org.kde.polkit-kde-authentication-agent-1",
}

for _, class in ipairs(float_classes) do
    hl.window_rule({
        name = "float-" .. class,

        match = {
            class = "^(" .. class .. ")$"
        },

        float = true,
    })
end

-- Common modal dialogs
local modal_titles = {
    "Open",
    "Authentication Required",
    "Add Folder to Workspace",
    "Open File",
    "Choose Files",
    "Save As",
    "Confirm to replace files",
    "File Operation Progress",
}

for _, title in ipairs(modal_titles) do
    hl.window_rule({
        name = "modal-" .. title,

        match = {
            title = "^(" .. title .. ")$"
        },

        float = true,
    })
end

hl.window_rule({
    name = "xdg-portal-float",

    match = {
        class = "^([Xx]dg-desktop-portal-gtk)$"
    },

    float = true,
})

hl.window_rule({
    name = "dialog-class",

    match = {
        class = "^(.*dialog.*)$"
    },

    float = true,
})

hl.window_rule({
    name = "dialog-title",

    match = {
        title = "^(.*dialog.*)$"
    },

    float = true,
})
