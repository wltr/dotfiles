vim.api.nvim_clear_autocmds({})

vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

vim.filetype.add({
  extension = {
    macro = 'jinja',
    plan = 'jinja'
  }
})

require('wltr.options')
require('wltr.largefile')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ import = 'wltr.plugins' })

require('wltr.autocmd')
require('wltr.keymap')
require('wltr.misc')
