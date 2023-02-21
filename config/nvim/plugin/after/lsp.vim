if executable('rustup') || executable('solargraph')
  lua << EOF
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client.server_capabilities.completionProvider then
          vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        end

        if client.server_capabilities.definitionProvider then
          vim.bo[args.buf].tagfunc = "v:lua.vim.lsp.tagfunc"
        end

        if client.server_capabilities.renameProvider then
          -- <F18> = <S-F6>
          vim.keymap.set('n', '<C-R>', vim.lsp.buf.rename, { buffer = args.buf })
        end

        if client.server_capabilities.referencesProvider then
          vim.keymap.set('n', 'g]', vim.lsp.buf.references, { buffer = args.buf })
        end

        if client.server_capabilities.signatureHelpProvider then
          vim.keymap.set('n', 'K', vim.lsp.buf.signature_help, { buffer = args.buf })
        end

        if client.server_capabilities.codeActionProvider then
          vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, { buffer = args.buf })
        end

        if client.server_capabilities.documentFormattingProvider then
          vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
        end
      end,
    })

    local nvim_lsp = require('lspconfig')

    nvim_lsp.solargraph.setup {
      flags = { debounce_text_changes = 150 },
      settings = {
        solargraph = {
          diagnostics = true,
          formatting = true
        }
      }
    }

    nvim_lsp.rust_analyzer.setup {
      flags = { debounce_text_changes = 150 }
    }
EOF
endif
