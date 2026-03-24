local M = {}

function M.setup()
    vim.lsp.config("sqls", {                               -- Configuration for the sql language server
        cmd = {"sqls"},
        filetypes = {"sql"}
    })
    vim.lsp.enable("sqls")

    vim.lsp.config('gopls', {                              -- Configuration for the 'gopls' language server
        cmd = { 'gopls' },                                 -- Command to run the language server
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' }, -- File types to attach to
        root_markers = { 'go.mod', 'go.work', '.git' },    -- Project root markers
        settings = {
            gopls = {
                completeUnimported = true,                 -- Enable completion of unimported packages
                usePlaceholders = true,                    -- Use placeholders in completion snippets
                analyses = {
                    unusedparams = true,                   -- Enable "unused parameters" analysis
                    unusedvariable = true,                 -- Enable "unused variables" analysis
                    shadow = true,                         -- Enable "shadowed variables" analysis
                    unreachable = true,                    -- Enable "unreachable" analysis
                },
                staticcheck = true,
                gofumpt = true
            },
        },
        on_attach = function(client, bufnr)                -- Set omnifunc for auto completion support
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        end
    })
    vim.lsp.enable('gopls')                               -- Enable lsp for gopls
end

return M
