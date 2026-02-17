vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>ss", "<C-w>x", { desc = "Swap windows" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tabs management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to prev tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- copy the current file's path to the clipboard
keymap.set("n", "<leader>cp", ":let @+ = expand('%:~:.')<CR>", { desc = "[C]opy [P]ath" })

-- NvimTree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current buffer" })
-- keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- Telescope
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help tags" })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
-- NOTE: Configured in telescope/multigrep.lua
-- keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find string in buffers" })

-- Vim Maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" })

-- LazyGit
keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "LazyGit" })
keymap.set("n", "<leader>ll", "<cmd>LazyGitFilterCurrentFile<CR>", { desc = "LazyGit Current File Log" })

-- GitBlame
keymap.set("n", "<leader>gO", "<cmd>GitBlameOpenCommitURL<CR>", { desc = "Open commit url on Github" })

-- Marks (aka Bookmarks)
keymap.set("n", "<leader>ml", "<cmd>marks<CR>", { desc = "Show list of bookmarks" })
keymap.set("n", "<leader>mD", "<cmd>delmarks a-zA-Z0-9<CR>", { desc = "Show list of bookmarks" })

-- Oil (File explorer within buffers)
keymap.set("n", "<leader>eo", "<cmd>Oil<CR>", { desc = "Open parent directory (Oil)" })

-- Copilot
-- keymap.set("i", "<C-Enter>", "copilot#Accept('\\<CR>')", {
--   expr =true,
--   replace_keycodes = false,
--   desc = "Copilot accept suggestion"
-- })
-- vim.g.copilot_no_tab_map = true

-- Lua Development
keymap.set("n", "<leader><space>x", "<cmd>source %<CR>", { desc = "Source current file" })
keymap.set("n", "<leader>x", "<cmd>:.lua<CR>", { desc = "Execute current lua line code" })
keymap.set("v", "<leader>x", "<cmd>:lua<CR>", { desc = "Execute current lua block code" })
