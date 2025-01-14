local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha (Gogh)"

config.font_dirs = { "fonts" }
config.font_size = 14
config.font = wezterm.font_with_fallback({
	"Geist Mono",
	"GalmuriMono11",
})

return config
