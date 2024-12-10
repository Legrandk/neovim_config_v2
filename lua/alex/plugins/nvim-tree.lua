return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree doc
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup {
      update_focused_file = {
        enable = true,
      },
      actions = {
        use_system_clipboard = false,
        open_file = {
          window_picker = {
            enable = true,
          },
        },
      },
      filters = {
        dotfiles = true,
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      view = {
        relativenumber = true,
        width = 40,
      },
    }
  end
}
