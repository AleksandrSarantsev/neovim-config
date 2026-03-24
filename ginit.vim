" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    GuiFont FiraCode\ Nerd\ Font\ Mono:h12
endif

if exists(':GuiRenderLigatures')
    GuiRenderLigatures v:true
endif

" Configure past shortcut for insert and command(not working only for pick windows, but it may be lacks of plugin)
" No need for normal mode just use 'p', so it also preferred over Insert mode because don't have indention issues
imap <C-S-v> <C-r>+
cmap <C-S-v> <C-r>+

