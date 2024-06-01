return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
      local telescope = require('telescope')
      local lga_actions = require('telescope-live-grep-args.actions')

      local fzf_opts = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case'
      }

      telescope.setup{
        defaults = {
          path_display = { 'truncate' },
          layout_strategy = 'vertical',
          layout_config = { height = 0.95 }
        },
        pickers = {
          lsp_dynamic_workspace_symbols = {
            sorter = telescope.extensions.fzf.native_fzf_sorter(fzf_opts)
          }
        },
        extensions = {
          fzf = fzf_opts,
          live_grep_args = {
            auto_quoting = true,
            default_mappings = {},
            mappings = {
              i = {
                ['<C-k>'] = lga_actions.quote_prompt(),
                ['<C-i>'] = lga_actions.quote_prompt({postfix = ' --iglob '}),
                ['<C-f>'] = lga_actions.quote_prompt({postfix = ' -t '}),
              }
            }
          }
        }
      }
      telescope.load_extension('fzf')
      telescope.load_extension('live_grep_args')
    end
  },

  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
  'nvim-telescope/telescope-live-grep-args.nvim'
}
