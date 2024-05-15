vim.api.nvim_create_augroup('TrimTrailingWhitespace', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  group = 'TrimTrailingWhitespace',
  callback = function()
    local current_file = vim.api.nvim_buf_get_name(0)
    local ext = vim.fn.fnamemodify(current_file, ':e')
    if ext == 'plan' then
      return
    end
    vim.cmd('%s/\\s\\+$//e')
  end
})

vim.api.nvim_create_augroup('CppPragmaOnce', {})
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.h,*.hpp',
  group = 'CppPragmaOnce',
  command = 'normal! i#pragma once\n\n'
})

vim.api.nvim_create_augroup('SheBang', {})
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.sh',
  group = 'SheBang',
  command = 'normal! i#! /bin/bash\n\n'
})
vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*.py',
  group = 'SheBang',
  command = 'normal! i#! /usr/bin/env python3\n\n'
})

vim.api.nvim_create_augroup('YankHighlight', {})
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  group = 'YankHighlight',
  callback = function()
    require('vim.highlight').on_yank{ higroug = 'IncSearch', timeout = 300, visual = false }
  end
})
