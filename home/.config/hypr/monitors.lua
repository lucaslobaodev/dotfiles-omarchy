-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 2

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Monitor HDMI EM CIMA, tela do notebook embaixo (centralizada).
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "277x1080", scale = 1 })

-- TV Samsung (via HDMI) à DIREITA da tela do notebook. Casa pela descrição, então não afeta o monitor.
hl.monitor({ output = "desc:Samsung Electric Company SAMSUNG", mode = "1920x1080@60", position = "3286x0", scale = 1 })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- Workspaces: o Omarchy dá 1-10 próprios a cada monitor (default/hypr/monitor-workspaces.lua).
-- A antiga regra "ímpares no HDMI, pares no notebook" foi removida em 2026-11-08: brigava com isso.
