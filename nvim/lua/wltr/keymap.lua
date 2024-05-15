local function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

keymap('n', '<space>e', vim.diagnostic.open_float)
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<space>q', vim.diagnostic.setloclist)

keymap('n', '<C-N>', ':NvimTreeToggle<CR>')
keymap('n', '<C-M-N>', ':NvimTreeFindFile<CR>')

keymap('n', '<tab>', ':b#<CR>')
keymap('n', '<C-L>', ':bnext<CR>')
keymap('n', '<C-H>', ':bprevious<CR>')
keymap('n', '<C-Q>', ':BDelete this<CR>')
keymap('n', '<C-W><C-J>', ':exe "resize +5"<CR>')
keymap('n', '<C-W><C-K>', ':exe "resize -5"<CR>')
keymap('n', '<C-W><C-L>', ':exe "vertical resize +5"<CR>')
keymap('n', '<C-W><C-H>', ':exe "vertical resize -5"<CR>')

keymap({'n', 'x'}, 'gea', ':EasyAlign')

keymap('n', 'gs', ':ClangdSwitchSourceHeader<CR>')

keymap('t', '<leader>e', '<C-\\><C-n>')

keymap('n', '<C-P>', require('telescope.builtin').git_files)
keymap('n', '<leader>ff', require('telescope.builtin').find_files)
keymap('n', '<leader>fd', require('telescope.builtin').lsp_document_symbols)
keymap('n', '<leader>fg', require('telescope.builtin').live_grep)
keymap('n', '<leader>fb', require('telescope.builtin').buffers)
keymap('n', '<leader>fh', require('telescope.builtin').help_tags)
keymap('n', '<leader>fm', require('telescope.builtin').marks)
keymap('n', '<leader>fl', require('telescope.builtin').current_buffer_fuzzy_find)
keymap('n', '<leader>fh', require('telescope.builtin').oldfiles)
keymap('n', '<leader>fr', require('telescope.builtin').git_status)
keymap('n', '<leader>8', require('telescope.builtin').grep_string)

keymap('n', '<leader>rc', ':execute "e" expand("%:p:h")."/CMakeLists.txt"<CR>')
keymap('n', '<leader>uc', function()
  local current_file = vim.api.nvim_buf_get_name(0)
  local output = vim.fn.system{ 'python3', 'development/find_cmake_dep.py', '--update', current_file }
  local stripped, _ = output:gsub('\n$', '')
  print(stripped)
end)