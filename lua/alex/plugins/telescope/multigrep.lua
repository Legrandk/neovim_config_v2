local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local config = require("telescope.config").values

local M = {}

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local args = { "rg" }

      local idx = vim.fn.stridx(prompt, "  ")

      table.insert(args, "-e")
      table.insert(args, string.sub(prompt, 1, idx))

      if idx > -1 then
        local globs = string.sub(prompt, idx + 2)
        globs = vim.re.gsub(globs, "%s+", " ")
        local tokens = vim.split(globs, " ")
        for _, glob in ipairs(tokens) do
          table.insert(args, "-g")
          table.insert(args, glob)
        end
      end

      ---@diagnostic disable-next-line: deprecated
      return vim.tbl_flatten {
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"},
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Multi Grep",
    finder = finder,
    previewer = config.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end

M.setup = function()
  vim.keymap.set("n", "<leader>fg", live_multigrep, { desc = "Find string in cwd (improved)" })
end

return M
