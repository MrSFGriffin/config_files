local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "AdventureTime"
config.default_prog = { "powershell" }
--config.font = wezterm.font("Mononoki Nerd Font")

function config_pane_switching()
	if config.keys == nil then
		config.keys = {}
	end

	local directions = { "Left", "Right", "Down", "Up" }
	local vim_keys = { "h", "l", "j", "k" }
	-- unbind defaults
	for _, key in ipairs(directions) do
		table.insert(config.keys, {
			key = key .. "Arrow",
			mods = "CTRL|SHIFT",
			action = wezterm.action.Nop,
		})
	end
	-- bind ALT-vim-directions to pane switching commands
	for i = 1, #directions do
		table.insert(config.keys, {
			mods = "ALT",
			key = vim_keys[i],
			action = wezterm.action.ActivatePaneDirection(directions[i]),
		})
	end
end

config.enable_scroll_bar = true
config.window_padding = {
	right = "2cell",
}
config_pane_switching()

return config
