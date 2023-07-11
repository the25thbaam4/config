require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "jdtls" }
})


local on_attach = function(_ , _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {} )
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implemention, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end 


local capabilities = require('cmp_nvim_lsp').default_capabilities()


require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- require("lspconfig").jdtls.setup{}
require('lspconfig').jdtls.setup {
  on_attach = function(client, bufnr)
    -- Customize the configuration as needed

    -- Keybindings for code navigation
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
  end,
  -- other configuration options
}

