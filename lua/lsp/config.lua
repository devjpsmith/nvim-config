local mason_servers = require('lsp.mason_servers')
local servers = require('lsp.servers')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup({
    ensure_installed = mason_servers
})

require('lsp.lua_ls')

vim.diagnostic.config({
    virtual_text = {
        spacing = 2,
        source = "if_many",
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

for _, server in ipairs(servers) do
    local config = {
        capabilities = capabilities,
        on_attach = function(_, bufnr)
            -- local opts = { buffer = bufnr }

            require('lsp.keymaps')
        end,
    }

    if server == 'solargraph' then
        config.cmd = {
            'solargraph',
            'stdio',
        }
    end

    if server == 'emmet_language_server' then
        config.filetypes = {
            "html",
            "css",
            "scss",
            "sass",
            "javascriptreact",
            "typescriptreact",
            "vue",
            "xml",
        }
    end

    vim.lsp.config(server, config)
    vim.lsp.enable(server)
end
