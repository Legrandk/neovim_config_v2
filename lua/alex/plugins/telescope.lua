return {
  "nvim-telescope/telescope.nvim",
  -- tag = "0.1.1",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- move to prev result
          },
        },
        extensions = {
          fzf = {},
        }
      },
    })

    telescope.load_extension("fzf")

    require("alex.plugins.telescope.multigrep").setup()
    require("alex.plugins.telescope.where_is_my_test").setup()
  end,
}
