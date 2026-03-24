local M = {}

function M.setup()
    vim.api.nvim_create_autocmd("BufWritePre", {          -- Add formatting and import missed packages check on save
        pattern = "*.go",
        callback = function()
            local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
            local params = vim.lsp.util.make_range_params(0, enc)
            params.context = {only = {"source.organizeImports"}}
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
            for cid, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                    if r.edit then
                        vim.lsp.util.apply_workspace_edit(r.edit, enc)
                    end
                end
            end
            vim.lsp.buf.format({async = false})
        end
    })

    vim.api.nvim_create_autocmd("FileType", {             -- Create auto command to set tab settings for go files
        pattern = "go",
        callback = function()
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4
            vim.opt_local.expandtab = false
        end
    })
end

return M
