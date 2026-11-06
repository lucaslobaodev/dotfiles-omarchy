-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 2

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Monitor HDMI à esquerda, tela do notebook à direita.
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = 1 })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "1920x0", scale = 1 })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- Ímpares na 2ª tela (HDMI), pares na tela do notebook.
for i = 1, 10 do
  hl.workspace_rule({ workspace = tostring(i), monitor = (i % 2 == 1) and "HDMI-A-1" or "eDP-1", default = (i <= 2) })
end
