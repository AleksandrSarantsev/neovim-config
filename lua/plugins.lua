local M = {}

function M.setup()
    local mini_path = vim.fn.stdpath('data') .. '/site' .. '/pack/deps/start/mini.nvim'  -- Generate plugin path
    if not vim.loop.fs_stat(mini_path) then
        vim.cmd('echo "Installing `mini.nvim`" | redraw')
        vim.fn.system({                                                                  -- Clone mini.nvim repository
            'git',
            'clone',
            '--filter=blob:none',
            '--branch',
            'stable',
            'https://github.com/nvim-mini/mini.nvim',
            mini_path
        })
        vim.cmd('packadd mini.nvim | helptags ALL')                                      -- Add plugin from file
        vim.cmd('echo "Installed `mini.nvim`" | redraw')
    end

    -- if not vim.loop.fs_stat(mini_path) then            -- Replace with neovim package manager when it will be added
    --     vim.pack.add({'https://github.com/nvim-mini/mini.nvim'})
    -- else
    --     vim.pack.update({'https://github.com/nvim-mini/mini.nvim'})
    -- end

    require("mini.align").setup({})        -- Align text interactively
    require("mini.bracketed").setup({})    -- Go forward/backward with square brackets
    require("mini.clue").setup({})         -- Show next key clues
    require("mini.cmdline").setup({})      -- Command line tweaks
    require("mini.comment").setup({})      -- Comment lines
    require("mini.completion").setup({})   -- Completion and signature help
    require("mini.cursorword").setup({})   -- Auto highlight word under cursor
    require("mini.diff").setup({})         -- Work with diff hunks
    require("mini.files").setup({})        -- Navigate and manipulate file system
    require("mini.git").setup({})          -- Git integration
    require("mini.hipatterns").setup({})   -- Highlight patterns in text
    require("mini.icons").setup({})        -- Icon provider
    require("mini.indentscope").setup({})  -- Visualize and work with indent scope
    require("mini.notify").setup({})       -- Show notifications
    require("mini.operators").setup({})    -- Text edit operators
    require("mini.pairs").setup({})        -- Auto pairs
    require("mini.pick").setup({})         -- Pick anything
    require("mini.sessions").setup({})     -- Session management
    require("mini.snippets").setup({})     -- Manage and expand snippets
    require("mini.splitjoin").setup({})    -- Split and join arguments
    require("mini.starter").setup({})      -- Start screen
    require("mini.statusline").setup({})   -- Status line
    require("mini.surround").setup({})     -- Surround actions
    require("mini.tabline").setup({})      -- Tab line
    require("mini.trailspace").setup({})   -- Trail space (highlight and remove)
    require("mini.visits").setup({})       -- Track and reuse file system visits

    require("mini.basics").setup({         -- Common configuration presets
        options = {                        -- Options. Set field to `false` to disable.
            basic = true,                  -- Basic options ('number', 'ignorecase', and many more)
            extra_ui = true,               -- Extra UI features ('winblend', 'listchars', 'pumheight', ...)
            win_borders = 'auto',          -- Presets for window borders ('single', 'double', ...)
        },
        mappings = {                       -- Mappings. Set field to `false` to disable.
            basic = true,                  -- Basic mappings (better 'jk', save with Ctrl+S, ...)
            option_toggle_prefix = [[\]],  -- Prefix for mappings that toggle common options ('wrap', 'spell', ...)
            windows = true,                -- Window navigation with <C-hjkl>, resize with <C-arrow>
            move_with_alt = true,          -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
        },
        autocommands = {                   -- Auto commands. Set field to `false` to disable
            basic = true,                  -- Basic auto commands (highlight on yank, start Insert in terminal, ...)
            relnum_in_visual_mode = true,  -- Set 'relativenumber' only in linewise and blockwise Visual mode
        },
        silent = true,                     -- Whether to disable showing non-error feedback
    })

    indentscope = require("mini.indentscope")
    indentscope.setup({
        draw = {                            -- Draw options
            animation = indentscope.gen_animation.none(),  -- Disable animation
            predicate = function(scope)     -- Whether to auto draw scope: return `true` to draw, `false` otherwise
                return not scope.body.is_incomplete
            end,
            delay = 100,                    -- Delay (in ms) between event and start of drawing scope indicator
            priority = 2,                   -- Symbol priority. Increase to display on top of more symbols.
        },
        mappings = {                        -- Module mappings. Use `''` (empty string) to disable one.
            object_scope = 'ii',
            object_scope_with_border = 'ai',
            goto_top = '[i',
            goto_bottom = ']i',
        },
        options = {                         -- Options which control scope computation
            border = 'both',                -- Type of scope's border: 'both', 'top', 'bottom', 'none'
            indent_at_cursor = true,        -- Whether to use cursor column when computing reference indent
            n_lines = 10000,                -- Maximum number of lines which scope is computed
            try_as_border = false,          -- Check input line to be a border of adjacent scope
        },
        symbol = '|'                       -- Which character to use for drawing scope indicator
    })

    require("mini.extra").setup({})        -- Extra 'mini.nvim' functionality

    base16 = require("mini.base16")        -- Base16 color scheme creation
    base16.setup({
        palette = base16.mini_palette("#1a1b23", "#dbdbbd", 75)  -- Yellow accent
        -- palette = base16.mini_palette("#1a1b23", "#bddbbd", 75)  -- Green accent
        -- palette = base16.mini_palette("#1a1b23", "#bdbddb", 75)  -- Magenta accent
    })

    misc = require("mini.misc")             -- Miscellaneous functions
    misc.setup({})
    misc.setup_auto_root({                  -- Add automatic root folder detection based on given files
        ".git",
        ".svn",
        "build",
        "compile_commands.json",
        "go.mod",
        "go.sum",
        "readme",
        "src",
        "tags",
        "CHANGELOG",
        "CMakeLists.txt",
        "LICENSE",
        "README"
    })
    misc.setup_restore_cursor({})           -- Add automatic restoration of cursor position on file reopen

    -- require("mini.ai").setup({})         -- Extend and create a/i text objects
    -- require("mini.animate").setup({})    -- Animate common Neovim actions
    -- require("mini.bufremove").setup({})  -- Remove buffers
    -- require("mini.colors").setup({})     -- Tweak and save any color scheme
    -- require("mini.deps").setup({})       -- Plugin manager
    -- require("mini.doc").setup({})        -- Generate Neovim help files
    -- require("mini.fuzzy").setup({})      -- Fuzzy matching
    -- require("mini.hues").setup({})       -- Generate configurable color scheme
    -- require("mini.jump").setup({})       -- Jump to next/previous single character
    -- require("mini.jump2d").setup({})     -- Jump within visible lines
    -- require("mini.map").setup({})        -- Window with buffer text overview
    -- require("mini.test").setup({})       -- Test Neovim plugins
end

return M
