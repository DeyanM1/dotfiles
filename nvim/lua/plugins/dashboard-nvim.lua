return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = {
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "",
        },
        center = {
          {
            icon = "󰈞  ",
            desc = "Find File                        ",
            action = "Telescope find_files",
            key = "ff",
          },
          {
            icon = "  ",
            desc = "Find Word                        ",
            action = "Telescope live_grep",
            key = "fg",
          },
          {
            icon = "  ",
            desc = "Recent Files                     ",
            action = "Telescope oldfiles",
            key = "fr",
          },
          {
            icon = "  ",
            desc = "New File                         ",
            action = "enew",
            key = "fn",
          },
          {
            icon = "♥  ",
            desc = "Healthcheck                         ",
            action = "checkhealth",
            key = "ch",
          },
          {
            icon = "  ",
            desc = "Open Config                      ",
            action = "edit ~/.config/nvim/init.lua",
            key = "co",
          },
          {
            icon = "󰗼  ",
            desc = "Quit                             ",
            action = "qa",
            key = "q",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          local pluginsLoaded = stats.loaded

          return {
            "",
            "",
            "Neovim loaded " .. pluginsLoaded .. " plugins",
            "",
            "",
          }
        end
      }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
