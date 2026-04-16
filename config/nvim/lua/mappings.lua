local map = vim.keymap.set

-- Fuzzy find in current buffer


-- general mappings
map("n", "<C-s>", "<cmd> w <CR>")
map("i", "jk", "<ESC>")
map("n", "<C-c>", "<cmd> %y+ <CR>") -- copy whole filecontent

-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <CR>")
map("n", "<C-h>", "<cmd> NvimTreeFocus <CR>")

-- netrw for old faction folks 
map("n", "<leader>rw", vim.cmd.Ex)

-- telescope
map("n", "<leader>ff", function()
  require('telescope.builtin').find_files()
end, { desc = "Find files" })

map("n", "<leader>fo", function()
  require('telescope.builtin').oldfiles()
end, { desc = "Open recent files" })

map("n", "<leader>fg", function()
  require('telescope.builtin').live_grep()
end, { desc = "Live grep (search in project)" })

map("n", "<leader>gt", function()
  require('telescope.builtin').git_status()
end, { desc = "Git status" })

map("n", "<leader>gf", function()
  require('telescope.builtin').git_files()
end, { desc = "Find git files" })

map("n", "<leader>sf", function()
  require('telescope.builtin').current_buffer_fuzzy_find()
end, { desc = "Fuzzy search in current file" })

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>")
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>")
map("n", "<C-q>", "<cmd> bd <CR>")

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true })
map("v", "<leader>/", "gc", { remap = true })

-- format
map("n", "<leader>fm", function()
  require("conform").format()
end)

-- clangd 
map("n", "<leader>ast", "<cmd> ClangdAST <CR>")
map("n", "<leader>si", "<cmd> ClangdSymbolInfo <CR>")
map("n", "<leader>th", "<cmd> ClangdTypeHierarchy <CR>")
map("n", "<leader>mo", "<cmd> ClangdMemoryUsage <CR>")
