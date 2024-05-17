local function sign(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
  virtual_text = { prefix = '●' }
})

vim.fn.matchadd('ErrorMsg', '^\\(<\\|=\\|>\\)\\{7\\}\\([^=].\\+\\)\\?$') -- git changes
