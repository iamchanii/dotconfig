local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Frappe"

config.font_dirs = { "fonts" }
config.font_size = 16
config.font = wezterm.font_with_fallback({
	"Geist Mono",
	"GalmuriMono11",
})

return config
