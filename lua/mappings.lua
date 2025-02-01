--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: mappings.lua
-- Description: Key mapping configs
-- Author: Pavel Danov <pavel.danov@vermilion.digital>

-- <leader> is a space now
local map = vim.keymap.set
local gs = require("gitsigns")
map("n", "<leader>q", ":qa!<CR>", {})
-- Fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>", {})
-- Move around splits
map("n", "<leader>wh", "<C-w>h", { desc = "switch window left" })
map("n", "<leader>wj", "<C-w>j", { desc = "switch window right" })
map("n", "<leader>wk", "<C-w>k", { desc = "switch window up" })
map("n", "<leader>wl", "<C-w>l", { desc = "switch window down" })

-- Reload configuration without restart nvim
map("n", "<leader>r", ":source $MYVIMRC<CR>", { desc = "Reload configuration without restart nvim" })

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Open Telescope to find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Open Telescope to do live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Open Telescope to list buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Open Telescope to show help" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Open Telescope to list recent files" })
map("n", "<leader>cm", builtin.git_commits, { desc = "Open Telescope to list git commits" })
-- NvimTree
map("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree sidebar" })    -- open/close
map("n", "<leader>nr", ":NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })         -- refresh
map("n", "<leader>nf", ":NvimTreeFindFile<CR>", { desc = "Search file in NvimTree" }) -- search file

-- LSP
map("n", "<leader>gm", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "gr", function() require("telescope.builtin").lsp_references() end, { desc = "Find references" })
vim.keymap.set("n", "gi", function() require("telescope.builtin").lsp_implementations() end, { desc = "Find implementations" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

-- Comment
map("n", "mm", "gcc", { desc = "Toggle comment", remap = true })
map("v", "mm", "gc", { desc = "Toggle comment", remap = true })

-- Toggle listchars
map("n", "<leader>tl", function()
	if vim.opt.list:get() then
		vim.opt.list = false
	else
		vim.opt.list = true
	end
end, { desc = "Toggle listchars"})

-- Gitsigns
map("n", "]h", function() gs.nav_hunk("next") end, { desc = "Next Git hunk" })
map("n", "[h", function() gs.nav_hunk("prev") end, { desc = "Previous Git hunk" })
-- Stage / Reset Hunks
map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Git hunk" })
map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Git hunk" })
map("v", "<leader>hs", function() gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "Stage selected hunk" })
map("v", "<leader>hr", function() gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, { desc = "Reset selected hunk" })
-- Undo Last Stage
map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo last staged hunk" })
-- Preview Hunk
map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Git hunk" })
-- Blame Line
map("n", "<leader>hb", gs.blame_line, { desc = "Git blame current line" })
map("n", "<leader>hB", function() gs.blame_line { full = true } end, { desc = "Full Git blame" })
-- Toggle Git Diff Signs
map("n", "<leader>ht", gs.toggle_signs, { desc = "Toggle Git signs" })
-- Reset Buffer
map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset entire file to last commit" })
-- Diff View
map("n", "<leader>hd", gs.diffthis, { desc = "Git diff against index" })
map("n", "<leader>hD", function() gs.diffthis("~1") end, { desc = "Git diff against last commit" })
-- Toggle Git Line Highlights
map("n", "<leader>hl", gs.toggle_linehl, { desc = "Toggle Git line highlights" })
