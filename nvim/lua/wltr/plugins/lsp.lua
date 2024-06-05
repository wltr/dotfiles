local clangd_path = '/usr/local/ht-clang-17-0-1/bin/clangd'
local function is_ht()
   local f = io.open(clangd_path, 'r')
   if f ~= nil then
     io.close(f)
     return true
   end
   return false
end

local on_attach = function(client, bufnr)
  client.server_capabilities.document_formatting = true

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gK', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gk', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format{async = true} end, bufopts)

  local inlay_hints = require('clangd_extensions.inlay_hints')
  inlay_hints.setup_autocmd()
  inlay_hints.set_inlay_hints()
end

vim.lsp.set_log_level('info')

return {
  {
    'p00f/clangd_extensions.nvim',
    ft = {'c', 'cpp'},
    opts = {
      inlay_hints = {
        only_current_line = false,
        show_parameter_hints = false,
        other_hints_prefix = '-> ',
      }
    }
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local util = require('lspconfig.util')

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      capabilities.textDocument.semanticHighlighting = true
      capabilities.offsetEncoding = {'utf-16'}

      local clang_options
      if is_ht() then
        local compile_commands_dir = './build/'
        if string.find(vim.fn.getcwd(), 'platform') then
          compile_commands_dir = compile_commands_dir..'ub-18.04-clang-17.0.1-generic.debug/'
        end
        clang_options = {clangd_path, '-j=40', '--compile-commands-dir='..compile_commands_dir,
            '--background-index', '--clang-tidy', '--header-insertion=iwyu', '--all-scopes-completion',
            '--completion-style=bundled'}
      else
        clang_options = {'clangd', '--background-index', '--clang-tidy', '--header-insertion=iwyu',
            '--all-scopes-completion', '--completion-style=bundled'}
      end

      lspconfig.clangd.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = util.root_pattern('.git'),
        init_options = {clangdFileStatus = true},
        flags = {allow_incremental_sync = true, debounce_text_changes = 500},
        filetypes = {'c', 'cpp'},
        cmd = clang_options
      }

      lspconfig.jdtls.setup{
        on_attach = on_attach,
        capabilities = capabilities
      }

      lspconfig.verible.setup{
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = {'verible-verilog-ls', '--rules_config_search=true'}
      }
    end
  }
}
