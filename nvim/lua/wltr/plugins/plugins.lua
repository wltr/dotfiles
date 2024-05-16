return {
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup{style = 'cool'}
      require('onedark').load()
    end
  },

  'tpope/vim-surround',
  'tpope/vim-abolish',
  'tpope/vim-repeat',
  'tpope/vim-fugitive',
  'tpope/vim-speeddating',

  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',

  'junegunn/gv.vim',
  'junegunn/vim-slash',
  'junegunn/vim-peekaboo',

  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

      cmp.setup{
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            end
          end, { 'i', 's' }),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true })
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'path' },
          { name = 'buffer' }
        },
        sorting = {
          comparators = {
            cmp.config.compare.scopes,
            cmp.config.compare.locality,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            require('clangd_extensions.cmp_scores'),
            cmp.config.compare.length,
            cmp.config.compare.order,
          }
        }
      }

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = 'buffer' } }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  },

  {
    'junegunn/goyo.vim',
    config = function()
      vim.g.goyo_width = 120
      vim.g.goyo_height = '100%'
      vim.g.goyo_linenr = 1
    end
  },

  {
    'junegunn/vim-easy-align',
    config = function()
      vim.cmd([[
      let g:easy_align_delimiters = {
      \ '(': {
      \     'pattern': '(',
      \     'left_margin': 1,
      \     'right_margin': 0
      \   }
      \ }
      ]])
    end
  },

  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  },

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

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      local configs = require('nvim-treesitter.configs')
      configs.setup{
        ensure_installed = {'c', 'cpp', 'lua', 'vim', 'vimdoc', 'query', 'bash', 'tcl', 'python', 'gitcommit', 'verilog'},
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
  },

  -- {
  --   'nvim-treesitter/nvim-treesitter-context',
  --   config = function()
  --     require('treesitter-context').setup{
  --       enable = true,
  --       max_lines = 0,
  --       trim_scope = 'outer',
  --       patterns = {
  --         default = {
  --             'class',
  --             'function',
  --             'method'
  --         }
  --       }
  --     }
  --   end
  -- },

  {
    'folke/todo-comments.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    opts = {
      keywords = {
        HACK = {alt = {'DEBUG'}}
      },
      highlight = {
        keyword = 'bg',
        pattern = [[.*<(KEYWORDS)\s*(\([A-Z]{2,4}-[0-9]{1,6}\))*\s*:*]]
      }
    }
  },

  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      view = {width = 40},
      actions = {
        open_file = {
          resize_window = false
        }
      }
    }
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
      options = {
        theme = 'onedark',
        section_separators = '',
        component_separators = ''
      }
    }
  },

  {
    'kdheepak/tabline.nvim',
    dependencies = {'nvim-lualine/lualine.nvim', 'nvim-tree/nvim-web-devicons'},
    opts = {
      options = {
        show_filename_only = true,
        section_separators = {'', ''},
        component_separators = {'', ''}
      }
    }
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      scope = {
        show_start = false,
        show_end = false
      }
    }
  },

  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
  'nvim-telescope/telescope-live-grep-args.nvim',

  {'j-hui/fidget.nvim', config = true},
  {'numToStr/Comment.nvim', config = true},
  {'akinsho/git-conflict.nvim', config = true},

  {'nvim-lua/plenary.nvim', lazy = true},
  {'nvim-tree/nvim-web-devicons', lazy = true},

  'Glench/Vim-Jinja2-Syntax',
  'PeterRincker/vim-argumentative',
  'amal-khailtash/vim-xdc-syntax',
  'bogado/file-line',
  'kazhala/close-buffers.nvim',
  'kshenoy/vim-signature',
  'mhinz/vim-signify',
  'rhysd/vim-clang-format',
  'roxma/vim-paste-easy'
}
