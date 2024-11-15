return {
  "f-person/git-blame.nvim",
  -- load the plugin at startup
  event = "VeryLazy",
  -- Because of the keys part, you will be lazy loading this plugin.
  -- The plugin wil only load once one of the keys is used.
  -- If you want to load the plugin at startup, add something like event = "VeryLazy",
  -- or lazy = false. One of both options will work.
  opts = {
    enabled = true,
    message_template = " <author> • <date> • <<sha>>",
    date_format = "%m-%d-%Y %H:%M",
    virtual_text_column = 80,
  },
}
