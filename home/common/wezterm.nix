{ ... }:
{
  programs.wezterm = {
    extraConfig = ''
      local a = wezterm.action

      local config = {}

      if wezterm.config_builder then
      	config = w.config_builder()
      end

      -- config.color_scheme = 'Catppuccin Mocha'
      config.color_scheme = 'Catppuccin Macchiato'
      -- config.color_scheme = 'tokyonight_moon'
      -- config.color_scheme = 'tokyonight-storm'

      config.keys = {
      	{
      		key = '1',
      		mods = 'ALT',
      		action = a.SendString '¡',
      	},
      	{
      		key = '2',
      		mods = 'ALT',
      		action = a.SendString '€',
      	},
      	{
      		key = '3',
      		mods = 'ALT',
      		action = a.SendString '#',
      	},
      	{
      		key = '4',
      		mods = 'ALT',
      		action = a.SendString '¢',
      	},
      	{
      		key = '5',
      		mods = 'ALT',
      		action = a.SendString '∞',
      	},
      	{
      		key = '6',
      		mods = 'ALT',
      		action = a.SendString '§',
      	},
      	{
      		key = '7',
      		mods = 'ALT',
      		action = a.SendString '¶',
      	},
      	{
      		key = '8',
      		mods = 'ALT',
      		action = a.SendString '•',
      	},
      	{
      		key = '9',
      		mods = 'ALT',
      		action = a.SendString 'ª',
      	},
      	{
      		key = '0',
      		mods = 'ALT',
      		action = a.SendString 'º',
      	},
      }

      config.enable_kitty_keyboard = true
      config.enable_scroll_bar = false
      config.enable_tab_bar = false

      config.exit_behavior = 'CloseOnCleanExit'

      config.font_size = 24
      config.font = w.font_with_fallback {
      	{ family = 'Nerd Operator', weight = 'Medium' },
      	{ family = 'JuliaMono', weight = 'Medium' },
      	{ family = 'VictorMono Nerd Font', weight = 'Regular' },
      }

      config.scrollback_lines = 0
      config.send_composed_key_when_left_alt_is_pressed = false

      config.window_background_opacity = 1
      config.macos_window_background_blur = 15

      config.window_decorations = 'RESIZE'
      config.window_padding = {
      	left = '28pt',
      	right = '30pt',
      	top = '30pt',
      	bottom = '20pt',
      }
      config.window_close_confirmation = 'NeverPrompt'

      return config
    '';
  };
}
