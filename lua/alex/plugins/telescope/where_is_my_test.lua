-- IMPROVE:
-- [] Look for RSPEC

local M = {}

local from_resource_to_test = function(opts, resource_full_filename_path)
  resource_full_filename_path = string.gsub(resource_full_filename_path, opts.cwd .. "/app/", "")

  local tokens = vim.split(resource_full_filename_path, "/")
  local filename = tokens[#tokens]
  local base_path = tokens[1]

  local pattern = string.gsub(filename, ".rb", "_test.rb")
  local path = { "test/" .. base_path }

  return pattern, path
end

local from_test_to_resource = function(opts, test_full_filename_path)
  test_full_filename_path = string.gsub(test_full_filename_path, opts.cwd .. "/test/", "")

  local tokens = vim.split(test_full_filename_path, "/")
  local filename = tokens[#tokens]
  local base_path = tokens[1]

  local pattern = string.gsub(filename, "_test.rb", ".rb")
  local paths = { "app/" .. base_path, base_path }

  return pattern, paths
end

local guess_pattern_and_path_from = function(opts, full_filename_path)
  if full_filename_path:match("_test.rb$") then
    return from_test_to_resource(opts, full_filename_path)
  else
    return from_resource_to_test(opts, full_filename_path)
  end
end

M.where_is_my_test = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local cur_file = vim.api.nvim_buf_get_name(0)

  local pattern, path = guess_pattern_and_path_from(opts, cur_file)

  require("telescope.builtin").find_files {
    find_command = { "find", path, "-type", "f", "-name", pattern },
  }
end

M.setup = function()
  vim.keymap.set("n", "<leader>ft", M.where_is_my_test, { desc = "Find test file" })
end

return M
