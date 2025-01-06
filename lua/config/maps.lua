local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local set = vim.keymap.set

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")
map("n", "<C-n>", "<CMD>Neotree filesystem reveal left<CR>")

-- New Windows
map("n", "<leader>v", "<CMD>vsplit<CR>")
map("n", "<leader>h", "<CMD>split<CR>")

-- Cycle through buffers
map("n", "<S-l>", "<CMD>bnext<CR>") -- NEXT
map("n", "<S-h>", "<CMD>bprevious<CR>") -- PREVIOUS

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
map("n", "<Esc>", "<CMD>noh<CR>")

map("n", "<leader>gg", "<CMD>LazyGit<CR>")

-- Tree-Sitter LSP diagnostics
set("n", "<leader>ld", vim.diagnostic.open_float)
set("n", "<leader>lp", vim.diagnostic.goto_prev)
set("n", "<leader>ln", vim.diagnostic.goto_next)
set("n", "<leader>ll", "<cmd>Telescope diagnostics<cr>")

-- Comments API
-- Toggle comment in normal mode
set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Toggle comment" })

-- Toggle comment in visual mode
set(
	"v",
	"<leader>/",
	"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
	{ desc = "Toggle comment" }
)

set("n", "<leader>c", function()
	require("bufdelete").bufdelete()
end)

set("n", "<leader>lr", function()
	vim.lsp.buf.rename()
end)
