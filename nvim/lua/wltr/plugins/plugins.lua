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
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',

  'junegunn/gv.vim',
  'junegunn/vim-slash',
  'junegunn/vim-peekaboo',

  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')

      local function lspkind_comparator(conf)
        local lsp_types = require('cmp.types').lsp
        return function(entry1, entry2)
          if entry1.source.name ~= 'nvim_lsp' then
            if entry2.source.name == 'nvim_lsp' then
              return false
            else
              return nil
            end
          end
          local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
          local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]
          local priority1 = conf.kind_priority[kind1] or 0
          local priority2 = conf.kind_priority[kind2] or 0
          if priority1 == priority2 then
            return nil
          end
          return priority2 < priority1
        end
      end

      local function no_text_kind(entry1, entry2)
        if entry1.source.name ~= 'nvim_lsp' then
          if entry2.source.name == 'nvim_lsp' then
            return false
          else
            return nil
          end
        end
        local lsp_types = require('cmp.types').lsp
        local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
        local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]
        if kind1 == Text and kind2 ~= Text then
          return false
        elseif kind2 == Text and kind1 ~= Text then
          return true
        else
          return nil
        end
      end

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
            no_text_kind,
            cmp.config.compare.scopes,
            cmp.config.compare.locality,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            require("clangd_extensions.cmp_scores"),
            lspkind_comparator({
              kind_priority = {
                Field = 11,
                Property = 11,
                Variable = 11,
                Constant = 10,
                Enum = 10,
                EnumMember = 10,
                Event = 10,
                Function = 10,
                Method = 10,
                Operator = 10,
                Reference = 10,
                Struct = 10,
                Class = 10,
                File = 8,
                Folder = 8,
                Module = 5,
                Keyword = 2,
                Constructor = 1,
                Interface = 1,
                Color = 0,
                Snippet = 0,
                Text = 0,
                TypeParameter = 0,
                Unit = 0,
                Value = 0,
              }
            }),
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
    'folke/todo-comments.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    opts = {
      keywords = {
        HACK = {alt = {'DEBUG'}}
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
    opts = {
      options = {
        show_filename_only = true,
        section_separators = {'', ''},
        component_separators = {'', ''}
      }
    }
  },

  -- {'ray-x/guihua.lua', cmd = 'cd lua/fzy && make'},
  -- 'ray-x/navigator.lua',
  -- 'ray-x/lsp_signature.nvim',
  --
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
  'nvim-telescope/telescope-live-grep-args.nvim',

  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', config = true},
  {'nvim-treesitter/nvim-treesitter-context', config = true},

  {'j-hui/fidget.nvim', config = true},
  {'numToStr/Comment.nvim', config = true},
  {'akinsho/git-conflict.nvim', config = true},
  {'lukas-reineke/indent-blankline.nvim', main = 'ibl', config = true},

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