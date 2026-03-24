local M = {}

function M.setup()
    vim.opt.tabstop = 4                                              -- Define tab indention size
    vim.opt.shiftwidth = 4                                           -- Define software indention size
    vim.opt.expandtab = true                                         -- Use spaces instead of tabs
    vim.opt.colorcolumn = "120"                                      -- Highlight 120th column
    vim.opt.spell = true                                             -- Enable spell check
    vim.opt.spelllang = {'en_us', 'ru'}                              -- Set language for spellcheck
    vim.opt.spelloptions = 'camel'                                   -- Set check for camel case words
    vim.opt.clipboard:append("unnamedplus")                          -- Set system clipboard to use copy register
    vim.opt.laststatus = 3                                           -- Set global status line
    vim.opt.scrolloff = 5                                            -- Set scrolling when 5 lines near end
    vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"  -- Set cursors for different modes
    vim.opt.guifont = "FiraCode Nerd Font Mono:h12"                  -- Set GUI font

    vim.filetype.add({extension = {pc = 'c', h = 'c'}})              -- Mark .pc and .h files as C

    if vim.loop.os_uname().sysname == "Windows_NT" then              -- Configure windows specific options
        vim.opt.shellslash = true                                    -- Set use of forward slashes for paths
        vim.opt.shell = '"C:/Program Files/Git/bin/bash.exe"'        -- Set the shell to git-bash executable
        vim.opt.shellcmdflag = "-c"                                  -- Set shell flags for correct command execution
        vim.opt.shellxquote = ""                                     -- Escape handling for quotes and spaces
        vim.opt.shellredir = ">%s 2>&1"                              -- Redirect output
        vim.opt.shellpipe = "2>&1| tee"                              -- Ensure '!' commands work correctly
        if vim.fn.hostname() == "SARANTSEV-NB" then                  -- Setup work specific settings
            vim.opt.tabstop = 3                                      -- Define tab indention size
            vim.opt.shiftwidth = 3                                   -- Define software indention size
            vim.opt.expandtab = true                                 -- Use spaces instead of tabs
        end
    end
end

return M
