return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')
      configs.setup{
        ensure_installed = {
          'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query', 'bash', 'tcl', 'python', 'gitcommit', 'verilog', 'yaml', 'json'
        },
        highlight = {
          enable = true,
          disable = not require('wltr.largefile').enable_except_large_or_diff(),
          additional_vim_regex_highlighting = false
        },
        indent = {
          enable = true
        }
      }
    end
  }
}
