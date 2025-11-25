local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_ease_in = "Ease"
config.scrollback_lines = 3000

-- Looks
config.initial_cols = 155
config.initial_rows = 33
config.color_scheme = 'Geohot'
config.font = wezterm.font('0xProto Nerd Font', { weight = "Regular" })
config.font_size = 10
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.line_height = 1.0

-- Behavior
config.window_close_confirmation = "NeverPrompt" -- "AlwaysPrompt"
config.default_prog = { 'C:/Program Files/Git/bin/bash.exe', '-i', '-l' }
config.default_cwd = "c:/git"

-- Material & looks
config.window_background_image = "C:/Users/TIMPE/Pictures/git_term_bg.jpeg"
-- config.window_background_opacity = 0
-- config.text_background_opacity = 1
-- config.win32_system_backdrop = "Tabbed" -- "Acrylic" "Mica"
-- config.win32_acrylic_accent_color = Blue

-- TAB BAR
config.use_fancy_tab_bar = true
-- config.show_close_tab_button_in_tabs = false --nightly
config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#BBBBBB',
    background = '#0b0022', -- Not applicable with fancy
  },
}

-- Switch to the last active tab when I close a tab
-- wezterm.config.switch_to_last_active_tab_when_closing_tab = true

-- TABS
config.window_frame = {
  -- The font used in the tab bar.
  -- Roboto Bold is the default; this font is bundled
  -- with wezterm.
  -- Whatever font is selected here, it will have the
  -- main font setting appended to it to pick up any
  -- fallback fonts you may have used there.
  font = wezterm.font { family = 'Roboto', weight = 'Bold' },

  -- The size of the font in the tab bar.
  -- Default to 10.0 on Windows but 12.0 on other systems
  font_size = 9.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333355',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333355',
}

-- right-status
wezterm.on('update-right-status', function(window, pane)
  local date = wezterm.strftime '%a %Y-%m-%d %H:%M:%S'

  window:set_right_status(wezterm.format {
  --    {Font = 'Arial'},
    { Foreground = { AnsiColor = 'Yellow' } },
    { Background = { Color = '#333355' } },
    { Text = ' ' .. date .. ' '},
  })
end)

-- Zoomed [Z] in tabs
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local zoomed = ''
  if tab.active_pane.is_zoomed then
    zoomed = '[Z] '
  end

  local index = ''
  if #tabs > 1 then
    index = string.format('[%d/%d] ', tab.tab_index + 1, #tabs)
  end

--  return zoomed .. index .. tab.active_pane.title
  return zoomed .. tab.active_pane.title
end)

-- Toast
wezterm.on('window-config-reloaded', function(window, pane)
  window:toast_notification('wezterm', 'Configuration reloaded.', nil, 4000)
end)

-- MOUSE
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = act.PasteFrom 'PrimarySelection',
  },

  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },

  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'CTRL|SHIFT',
    action = act.SendString 'explorer .\n',
  },
}

-- Launch Menu
config.launch_menu = {
  {
    -- Optional label to show in the launcher. If omitted, a label
    -- is derived from the `args`
    label = 'WSL - archlinux',
    -- The argument array to spawn.  If omitted the default program
    -- will be used as described in the documentation above
    args = { 'wsl', '-d', 'archlinux' },


    -- You can specify an alternative current working directory;
    -- if you don't specify one then a default based on the OSC 7
    -- escape sequence will be used (see the Shell Integration
    -- docs), falling back to the home directory.
    -- cwd = "/some/path"

    -- You can override environment variables just for this command
    -- by setting this here.  It has the same semantics as the main
    -- set_environment_variables configuration option described above
    -- set_environment_variables = { FOO = "bar" },
  },
  {
    -- Optional label to show in the launcher. If omitted, a label
    -- is derived from the `args`
    label = 'Git Bash',
    -- The argument array to spawn.  If omitted the default program
    -- will be used as described in the documentation above
    args = { 'C:/Program Files/Git/bin/bash.exe', '-i', '-l' },


    -- You can specify an alternative current working directory;
    -- if you don't specify one then a default based on the OSC 7
    -- escape sequence will be used (see the Shell Integration
    -- docs), falling back to the home directory.
    -- cwd = "/some/path"

    -- You can override environment variables just for this command
    -- by setting this here.  It has the same semantics as the main
    -- set_environment_variables configuration option described above
    -- set_environment_variables = { FOO = "bar" },
  },
  {
    label = "CMD",
    args = { 'CMD' },
  },
  {
    label = "Powershell",
    args = { 'Powershell' },
  },
}

-- Keys, Leader
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  -- Leader Fallback - Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
  -- SPLIT
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- EXPLORER
  {
    key = 'e',
    mods = 'LEADER',
    action = act.SendString 'explorer .\n',
  },
  -- EDIT Config
  {
    key = 'o',
    mods = 'LEADER',
    action = act.SendString 'notepad C:/Users/TIMPE/.wezterm.lua &\n',
  },

  -- MOVE tabs
  -- Move tab to pos 0
  {
    key = '0',
    mods = 'LEADER',
    action = wezterm.action.MoveTab(0),
  },
  -- Move tab to pos 1
  {
    key = '1',
    mods = 'LEADER',
    action = wezterm.action.MoveTab(0),
  },
  -- Move tab to pos 2
  {
    key = '2',
    mods = 'LEADER',
    action = wezterm.action.MoveTab(1),
  },
  -- Move tab to pos 3
  {
    key = '3',
    mods = 'LEADER',
    action = wezterm.action.MoveTab(2),
  },
  -- Move tab to pos 4
  {
    key = '4',
    mods = 'LEADER',
    action = wezterm.action.MoveTab(3),
  },
  -- Move tab to pos 5
  {
    key = '5',
    mods = 'LEADER',
    action = wezterm.action.MoveTab(4),
  },
  -- Move tab to last pos
--  {
--    key = '0',
--    mods = 'LEADER',
--    action = act.SendString(tostring( #( window:tabs() ) ) ),
--      action = act.SendString(tostring( window:tabs()  ) ),
--  },


}

return config
