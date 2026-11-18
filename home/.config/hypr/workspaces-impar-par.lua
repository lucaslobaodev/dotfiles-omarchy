-- Esquema da casa: workspaces ÍMPARES na tela externa (HDMI-A-1: monitor OU TV), PARES no notebook.
-- Substitui o "1-10 por monitor" do Omarchy (default/hypr/monitor-workspaces.lua), que não tem chave
-- para desligar. Para voltar ao padrão do Omarchy: apague o require deste arquivo no hyprland.lua.

for i = 1, 10 do
  hl.workspace_rule({ workspace = tostring(i), monitor = (i % 2 == 1) and "HDMI-A-1" or "eDP-1", default = (i <= 2) })
end

local M = o.workspaces

-- Desliga a reorganização automática (renumerava workspaces em blocos 11-20, 21-30...).
M.reconcile = function() end

-- SUPER+n = workspace global n (o clique na barra também passa por aqui).
M.focus = function(slot)
  local fn = function() hl.dispatch(hl.dsp.focus({ workspace = tostring(slot) })) end
  o.bind_expressions[fn] = "o.workspaces.focus(" .. slot .. ")"
  return fn
end

M.move_window = function(slot, follow)
  local fn = function()
    hl.dispatch(hl.dsp.window.move({ workspace = tostring(slot), follow = follow ~= false }))
  end
  o.bind_expressions[fn] = "o.workspaces.move_window(" .. slot .. (follow == false and ", false" or "") .. ")"
  return fn
end

for i = 1, 10 do
  local key = "code:" .. tostring(i + 9)
  o.rebind("SUPER + " .. key, "Switch to workspace " .. i, M.focus(i))
  o.rebind("SUPER + SHIFT + " .. key, "Move window to workspace " .. i, M.move_window(i))
  o.rebind("SUPER + SHIFT + ALT + " .. key, "Move window silently to workspace " .. i, M.move_window(i, false))
end
