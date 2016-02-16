"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Canux CHNEG                                                         "
" Email: canuxcheng@gmail.com                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" :qa close all windows without save.
" :xa close all windows and save.
" :only close all other windows except current one.
" <leader> default is \

" How to handle the windows.
" <C-w>hjkl to switch current window to other windows.
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use vim-plugin to manage other plugin                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All plugins in ~/.vim/bundle/

""""""""""""""""""""""" pathogen """"""""""""""""""""""
" Pathogen is a vim plugins manager script.
" Normally, we install pathogen under ~/.vim/autoload/pathogen.vim.
" Create the ~/.vim/bundle/ folder to manage all the vim scripts.
" Download other vim plugins and put it in bundle.

" If you want pathogen as a submodule as other plugins, use:
"runtime bundle/vim-pathogen/autoload/pathogen.vim
" Or
source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim

" Add pathogen to default path.
call pathogen#infect()
" Use other path.
"call pathogen#infect('/other/path/')

" Add the help file:
call pathogen#helptags()

"""""""""""""""""""""""" vundle """"""""""""""""""""""""""""
" Vundle is a vim plugins manager script.
" Put vundle in ~/.vim/bundle/ by default.

" Enable vuncle.
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim

" Add vundle in default path.
call vundle#begin()
" Add vundle in other path.
"call vundle#begin('/other/path')

" Add other plugin here.
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'tpope/vim-pathogen'
"Plugin 'Valloric/YouCompleteMe'
"......

" End vundle.
call vundle#end()

" How to use vuncle.
" Command line: vim +PluginInstall +qall
" In vim run :PluginInstall

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set basic action for VIM                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show all set env and options.
" :set all
set nocompatible
set noswapfile
set t_Co=256
set mouse=v "n v i c h a r
set mousemodel=popup
set selection=inclusive "or exclusive
set selectmode=mouse,key
set number "show line number
set cc=+1 "show right margin
set autochdir "go inside working directory of current opend file
set modifiable
set autowrite
set autoread
set smartindent
set autoindent "set auto retraction
set wildmenu "autocomplete the command line
set wildmode=list:longest "autocomplation the command
set backspace=2 "set backspace enable
set showmatch "set match model and show bracket
set linebreak "a word and return
set history=50 "set history command 50 tips
set laststatus=2 "always show the status line
set ruler "show row and column
set showcmd "show the command
set showmode "show the mode of vim
set ignorecase "ignore case when search
set incsearch "show match point when input string
set hlsearch "search highlight is on
set cursorcolumn "show current column highlight
set cursorline "show current line highlight
set modeline "modeline support
set t_ti= t_te= "when close vim show content on terminer.
set magic "for regular expressions
set scrolloff=7
set completeopt+=menuone,longest "default is menu,preview"

" Coding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set encoding=utf-8
set helplang=cn

" Wrapping
set textwidth=80
set formatoptions=croqn
set sidescroll=5

" Set tab
set smarttab "start with # will not be indent
set expandtab "auto convert tab to space
set shiftround
set tabstop=4 "set tab = 4 space
set shiftwidth=4 "set auto retraction = 4 space
set softtabstop=4 "indent 4 space

" Config fold
" :za open/close current fold
" :zM close all fold
" :zR open all fold
set foldenable
"set nofoldenable
set foldmethod=syntax
"set foldmethod=indent
set foldlevel=100 "0 - close fold
set foldcolumn=5 "set width of the fold

" Config syntax
" /usr/share/vim/vim74/syntax/*.vim to config different languages.
syntax enable
syntax on

" Enable full filetype detection.
filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

" Save as sudo
ca w!! w !sudo tee "%"

" autoload file after modify.
autocmd! bufwritepost .vimrc source %

""""""""""""""""""""""""config stardict""""""""""""""""""
" sudo apt-get install sdcv stardict
function! MyDict()
    let expl=system('sdcv -n '.expand("<cword>"))
    windo if expand("%")=="diCt-tmp" | q! | endif
    " Show in the left windows.
    "50vsp diCt-tmp
    " Show in the right windows.
    botright vertical 50split diCt-temp
    setlocal buftype=nofile bufhidden=hide noswapfile
    1s/^/\=expl/
    1
endfunction

" Use ctrl+s to use stardict.
nmap <S-s> :call MyDict()<CR>

"""""""""""""""""""""""config quickfix"""""""""""""""""""
" :help quickfix.txt - see the help doc.

" Make and open quickfix windows.
map <F9> :make<CR><CR><CR> :copen<CR><CR>
imap <F9> :make<CR><CR><CR> :copen<CR><CR>
" Make clean
map <F10> :make clean<CR><CR><CR>
imap <F10> :make clean<CR><CR><CR>
" Grep and open quickfix windows.
map <F11> :grep<CR><CR><CR> :copen<CR><CR>
imap <F11> :grep<CR><CR><CR> :copen<CR><CR>
" Close quickfix windows.
map <F12> :cclose<CR><CR>
imap <F12> :cclose<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and schemes and status line and display                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""config gvim""""""""""""""""""""
if (has("gui_running"))
    set background=light
    if has('win32')
        set guifont=Consolas\ For\ Powerline:h11
    elseif has('macvim')
        set lines=999
        set columns=999
        set guifont=Consolas\ For\ Powerline:h14
    elseif has('gtk2')
        set guifont=Inconsolata\ Medium\ 12
    endif
else
    set background=dark
endif

""""""""""config colors-schemes""""""""""
" Default colorscheme define in /usr/share/vim/vim74/colors/
" This include a lots of colorscheme.
"colorscheme github
"colorscheme google
"colorscheme winter
"colorscheme golden
"colorscheme desert
"colorscheme pyte

""""""""""config colors-solarized""""""""""
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

""""""""""config molokai""""""""""
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

"""""""""config airline"""""""""""""
" More good than powerline

" Enable/disable enhanced tabline.
let g:airline#extensions#tabline#enabled = 1

" Enable powerline symbols.
let g:airline_powerline_fonts = 1

" Define the symbols.
" This is unicode symbols.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"""""""""config indent-guides"""""""""
" Start this plugin when open vim
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Set your own color
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" git grep sed and awk for VIM                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""config ctrlp""""""""""
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
noremap <leader>m :CtrlPMRU<CR>
noremap <leader>c :CtrlPClearCache<CR>
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|tgz)$',
            \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

""""""""""""config fugitive"""""""""""
" Show in status line
set statusline+=%{fugitive#statusline()}

""""""""""""config gitgutter""""""""""
" Disable this plugin set up any mappings
let g:gitgutter_map_keys = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For web: javascript/html/css/xml                                            "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""config tern-for-vim""""""""""
" For javascript
" Need install node.js and npm
" Install tern use: cd .../tern-for-vim; npm install

""""""""""config vim-markdown"""""""""""""
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_folding_style_pythonic=1
let g:vim_markdown_no_default_key_mappings=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1

""""""""""config instant-markdown""""""""""
" gem install pygments.rb
" gem install redcarpet
" sudo npm -g install instant-markdown-d

" Auto start when open .md file.
let g:instant_markdown_autostart = 1
" Not update the display in realtime.
let g:instant_markdown_slow = 0

""""""""""config emmet-vim""""""""""
" omnifunc=emmet#completeTag

" Just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" Enable all function for all mode.
let g:user_emmet_mode='a'
" Default use <C-y>, to trigger, you can change <C-y>
let g:user_emmet_leader_key='<C-y>'
" Enable emmet for php and xml.
let g:user_emmet_settings = {
            \ 'php': {
            \ 'extends': 'html',
                \ 'filters': 'c',
            \ },
            \ 'xml': {
            \ 'extends': 'html',
            \ },
            \ 'haml': {
            \ 'extends': 'html',
            \ },}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Java                                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""config Eclim""""""""""
" Use syntastic as checker.
let g:EclimFileTypeValidate = 0
" Use omnifunc to complete.
let g:EclimCompletionMethod = 'omnifunc'

""""""""""config javacomplate2""""""""""
" omnifunc=javacomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Python                                                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""config riv"""""""""""

""""""""""config jedi-vim""""""""""
" Complete and goto and rename and pydoc for python
" Use YCM/jedi instead.
" Default Use <C-Space> to complete
" omnifunc=jedi#completions
" sudp pip install jedi

" Use YCM/jedi to complete.
let g:jedi#completions_enabled = 0
" Default use <C-Space> to complete.
let g:jedi#completions_command = "<C-Space>"

" Go to definition (or assignment), default <leader>d.
let g:jedi#goto_command = '<leader>g'
" Go to assignment, default <leader>g.
let g:jedi#goto_assignments_command = '<leader>a'
" Show pydoc documentation, default <k>.
let jedi#show_documentation = '<leader>d'
" Rename variables.
let g:jedi#rename_command = '<leader>r'
" Show usages of a name, default <leader>n.
let g:jedi#usages_command = '<leader>u'

""""""""""config python-mode""""""""""
" Use jedi-vim/YCM/Syntastic.

" Turn on the whole plugin
let g:pymode = 1
" Turn off plugin's warning
let g:pymode_warnings = 1
" Trim unused white space on save
let g:pymode_trim_whitespaces = 1
" Setup default python options
let g:pymode_options = 1
" Setup max line length
let g:pymode_options_max_line_length = 79
" Enable colorcolumn display at max_line_length
let g:pymode_options_colorcolumn = 1
" Setup pymode - quickfix window
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
" Set python version
let g:pymode_python = 'python' "or python3
" Enable pymode indentation
let g:pymode_indent = 1
" Enable pymode folding
let g:pymode_folding = 1
" Enable automatic virtualenv detection
let g:pymode_virtualenv = 1
"let g:pymode_virtualenv_path = $VIRTUAL_ENV

" Enable pymode-motion
let g:pymode_motion = 1
" C - class
" M - function(or method)
" [[ - jump to previous class or function
" ]] - jump to next class or function
" [M - jump to previous class or method
" ]M - jump to next class or method
" aC - select a class
" iC - select a inner class
" aM - select a function(or method)
" iM - select a inner function(or method)

" Turn on the run code script
let g:pymode_run = 1
" Bind key to run python code
let g:pymode_run_bind = '<leader>r'

" Enable functionality
let g:pymode_breakpoint = 1
" Bind keys
let g:pymode_breakpoint_bind = '<leader>b'
"let g:pymode_breakpoint_cmd = ''

"--------checkers-------
" Use syntastic instead.
" Pylama = pylint + pyflakes + pep8 + mccabe + pep257.
" Flake8 = pyflakes + pep8 + mccabe.
" sudo pip instll pep257
" sudo pip install flake8(pyflakes pep8 mccabe)
" Don't use pylint.
" sudo apt-get install pylint

" Use \ + 8 to start the checker.
"autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
" Use \ + 9 to auto fix pep8 errors.
autocmd FileType python map <buffer> <leader>8 :PymodeLintAuto<CR>

" Turn on code checking
let g:pymode_lint = 1
" Check code on every save, if file has been modified. Let syntastic do this.
let g:pymode_lint_on_write = 0
" Check code on every save, nomatter modified or not.
let g:pymode_lint_unmodified = 0
" Check code when editing
let g:pymode_lint_on_fly = 0
" Show error message if cursor placed at the error line
let g:pymode_message = 1
" Default code checkers
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe'] "default
"let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pep257']
" Skip errors and warnings
let g:pymode_lint_ignore = 'W0122'
" Select some error and warning from skip
let g:pymode_lint_select = '...'
" Sort errors by relevance
let g:pymode_lint_sort = []
" Auto open quickfix windows when any errors have been found
let g:pymode_lint_cwindow = 1

" Set pep8 options
let g:pymode_lint_options_pep8 =
            \ {'max_line_length': g:pymode_options_max_line_length}

" Set pep257 options
let g:pymode_lint_options_pep257 = {}

" Set pyflakes options
let g:pymode_lint_options_pyflakes = { 'builtins': '_' }

" Set mccabe options
let g:pymode_lint_options_mccabe = { 'complexity': 12 }

"--------syntax--------
" Turn on pymode syntax
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
let g:pymode_syntax_string_format = g:pymode_syntax_all
let g:pymode_syntax_string_templates = g:pymode_syntax_all
let g:pymode_syntax_doctests = g:pymode_syntax_all
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
let g:pymode_syntax_builtin_types = g:pymode_syntax_all
let g:pymode_syntax_docstrings = g:pymode_syntax_all

"--------pydoc--------
" Use pydoc for python

" Turn on the documentation script by pydoc.
let g:pymode_doc = 0
" Show pydoc documentation for current word, default <k>. Use jedi.
let g:pymode_doc_bind = ''

"---------rope---------
" Use YCM/jedi instead.
" Use rope to complete goto rename and pydoc for python
" omnifunc=pymode#rope#completions
" sudo apt-get install python-rope

" Turn on rope script
let g:pymode_rope = 0

" Enable searching for .ropeproject in parent directories
let g:pymode_rope_lookup_project = 0
" Set rope project directory
let g:pymode_rope_project_root = ""
" Set the rope folder name.
let g:pymode_rope_ropefolder = '.ropeproject'
" Show documentation for object under cursor
let g:pymode_rope_show_doc_bind = '<C-c>d'
" Regenerate project cache on every save
let g:pymode_rope_regenerate_on_write = 1

" Enable completion for rope
let g:pymode_rope_completion = 1
" Turn on autocomplation when typing a period
let g:pymode_rope_complete_on_dot = 0
" Keymap for autocomplate, default <C-Space>, YCM use this map.
let g:pymode_rope_completion_bind = ''

" Extended autocompletion from project
let g:pymode_rope_autoimport = 0
" Load modules to autoimport by default
let g:pymode_rope_autoimport_modules = ['os', 'sys']
" Offer to unresolved import object after completion
let g:pymode_rope_autoimport_after_complete = 0
" Bind the key
let g:pymode_rope_autoimport_bind = '<C-c>ra'
" Keymap for import
let g:pymode_rope_organize_imports_bind = '<C-c>ro'

" Jump to definition
let g:pymode_rope_goto_definition_bind = '<C-c>g'
" Command for open window when definition has been found
let g:pymode_rope_goto_definition_cmd = 'new'

" Keymap for rename method/function/class/variables
let g:pymode_rope_rename_bind = '<C-c>rr'
" Keymap for rename current module
let g:pymode_rope_rename_module_bind = '<C-c>rlr'

" keymap for convert module to package
let g:pymode_rope_module_to_package_bind = '<C-c>rlp'

" Keymap for extract method/variable
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_rope_extract_variable_bind = '<C-c>rl'

" Keymap for use function
let g:pymode_rope_use_function_bind = '<C-c>ru'

" Keymap for move method/fields
let g:pymode_rope_move_bind = '<C-c>rv'

" Keymap for change function signature
let g:pymode_rope_change_signature_bind = '<C-c>rs'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Common plugins                                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""config winmanager""""""""""
" :help netrw - see netrw help file.
" :help winmanager - see the winmanager help file.
" Use F2 to open or close winmanager window.
nnoremap <F2> <ESC> :WMToggle<CR>
let g:winManagerWindowLayout = 'BufExplorer|FileExplorer|TagList'
let g:winManagerWidth=40
" If just winmanager opend, close winmanager.
let g:persistentBehaviour=0 "If just

""""""""""config taglist""""""""""
" :help taglist.txt - see the taglist help file.
" TlistToggle just open or close the taglist.
nnoremap <silent> <F3> :TlistToggle<CR>
" Make TlistToggle open and jump to it.
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window=1 "show taglist on the right.
let Tlist_Auto_Open=0 "set the taglist open when open vim.
let Tlist_Close_On_Select=0 "when file or tag selected close taglist.
let Tlist_Exit_OnlyWindow=1 "when just taglist close the vim.
let Tlist_Use_SingleClick=1 "to jump to a tag on a single mouse click.
let Tlist_Auto_Highlight_Tag=1 "hightlight the tag.
let Tlist_Highlight_Tag_On_BufEnter=1 "hightlight the buffer tag.
let Tlist_Process_File_Always=1 "update tags when taglist not opened.
let Tlist_Show_One_File=1 "just show one taglist for a file
let Tlist_File_Fold_Auto_Close=1 "auto close the folder not used.
let Tlist_Sort_Type="name" "sort by name or order
let Tlist_Inc_Winwidth=1 "when tag closed make vi origin.
let Tlist_Compact_Format=1 "reduce the empty line in the taglist.
let Tlist_Enable_Fold_Column=1 "display the tag fold col.
let Tlist_Display_Prototype=0 "show the tag proto not the name.
let Tlist_Display_Tag_Scope=1 "show the scope.
let Tlist_Auto_Update = 1 "Auto update taglist
let Tlist_Show_Menu=1 "show the menu in gui vi.
let Tlist_Ctags_Cmd='/usr/bin/ctags'
set statusline+=%<%f%=%([%{Tlist_Get_Tagname_By_Line()}]%) "show the tag name in the statu line.
set title titlestring+=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%) "show the tag name in window title bar.

""""""""""config tagbar""""""""""
" More good than taglist
" Use F4 to open tagbar
nnoremap <F4> <ESC> :TagbarToggle<CR>
" Autofocus on Tagbar open
let g:tagbar_autofocus = 1

""""""""""config NERDTree""""""""""
" More good than winnamager-fileexplorer
" Use F5 to open the nerdtree
nnoremap <F5> <ESC> :NERDTreeToggle<CR>
" Make nerdtree on the right, default is left.
let g:NERDTreeWinPos = 'right'
" Switch CWD on root change
let g:NERDTreeChDirMode = 2
" If just nerdtree opened, close vim.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""config Bufexplorer""""""""""
" Use F6 to open buffer
noremap <silent> <F6> :BufExplorer<CR>
noremap <silent> <m-F6> :BufExplorerHorizontalSplit<CR>
noremap <silent> <c-F6> :BufExplorerVerticalSplit<CR>
let g:bufExplorerSplitRight=1
let g:bufExplorerMaxHeight=20 "default is 15. for winmanager.

""""""""""config minibufexplorer""""""""""
" :help buffer to see the default buffer manual.
" Use F7 to open and close the buffer.
map <F7> <ESC> :TMiniBufExplorer<CR>
" Ctrl+tab switch to next buffer and open it.
" Ctrl+shift+tab switch to front buffer and open it.
let g:miniBufExp1MapCTabSwitchBufs=1
let g:miniBufExp1MapWindowNavVim=1 "use ctrl+h/j/k/l
let g:miniBufExp1MapWindowNavArrows=1 "use ctrl+arrows
let g:miniBufExp1ModSelTarget=1

""""""""""config delimitMate""""""""""""
" Automatic closing quotes, etc...
let delimitMate_expand_cr = 1

""""""""""config surround"""""""""""
" Action for surroundings.
let g:loaded_surround = 1

"""""""""config nerdcommenter"""""""
" Action for commenting.
let g:loaded_nerd_comments = 1

""""""""""config easymotion""""""""""
let g:EasyMotion_smartcase = 1

""""""""""rainbow_parentheses""""""""""
" Highlight the parentheses.

""""""""""trailing-whitespace""""""""""
" Highlight the trailing whitespace.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe And  Ultisnips                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""config omnifunc""""""""""
" Just use YCM to complete everything.
" omnifunc just in /usr/share/vim/vim74/autoload
" Use <C-x><C-o> for omnifunc
" Use <C-x><C-u> for completefunc

" For perl
" Use perlomni.vim
"setlocal omnifunc=PerlComplete

" For ruby and rails
" omnifunc=rubycomplete#Complete

" For php
" omnifunc=phpcomplete#Complete

" When completeopt set to preview close preview windows after complete:
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""""""""config syntastic"""""""""""""
" Just use YCM to check the Syntastic.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Set the symbol
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = 'S⚠'
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = 'S✗'

" Show errors in location-list.
let g:syntastic_always_populate_loc_list = 1
" Auto close and open the location-list.
let g:syntastic_auto_loc_list = 1
" When open file check syntax, default 0
let g:syntastic_check_on_open = 1
" Check syntax when write.
let g:syntastic_check_on_wq = 1
" Ignore files you don't want to check.
let g:syntastic_ignore_files = []
" Specify the shell
let g:syntastic_shell = '/bin/bash'
" Add new filetype
let g:syntastic_extra_filetypes = [ 'make', 'gitcommit', 'nagios' ]
" Active perl checker
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl']

" Set active mode and passitive mode.
let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "active_filetypes": [],
            \ "passive_filetypes": [] }

" For python
" pylama = flake8 + pep257 + pylint
"let g:syntastic_python_checkers = ['pylama']
let g:syntastic_python_checkers = ['flake8']

""""""""""config ultisnips"""""""""""""
" Auto complete for snippets.

" Fix the <tab> confix with YCM
let g:UltiSnipsExpandTrigger = '<leader><tab>'
let g:UltisnipsJumpForwardTrigger = '<leader><tab>'
let g:UltisnipsJumpBackwardTrigger = '<leader><s-tab>'

""""""""""config YouCompleteMe""""""""""
" How to install with git:
" git clone https-url
" git submodule update --init --recursive
" cd YouCompleteMe; ./install.py --clang-completer --tern-completer

" Include clang for c/c++/oc/oc++
" Include jedi for python
" Include tern for javascript
" Include supertab neocomplete and syntastic's functions.
" Can use omnifunc for ruby/php/perl...

" For c/cpp/oc/ocpp use this file to work.
if !empty(glob('~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'))
    let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
endif

" YCM can trigged completion menu automatically after typing ./->/:: ...
let g:ycm_auto_trigger = 1
" You can also use <C-Space> to popup completion menu.
let g:ycm_key_invoke_completion = '<C-Space>'

nnoremap <F8> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_min_num_identifier_candidate_chars = 0
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_indentifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
" Set the goto action in [ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab', 'new-or-existing-tab' ]
let g:ycm_goto_buffer_command = 'same-buffer'

" For omnifunc
let g:ycm_cache_omnifunc = 1

" For syntastic
" For c/cpp/oc/ocpp use YCM not use syntastic as checker.
let g:ycm_show_diagnostics_ui = 1

" For ultisnips
let g:ycm_use_ultisnips_completer = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For text content                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""config tablify""""""""""

""""""""""config wiki""""""""""
let g:vimwiki_list = [{'path': '~/.vimwiki/'}]

""""""""""config nagios""""""""""""

"""""""""config puppet""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autogenerate the title                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.h,*.c,*.cpp,*.java,*.sh,*.pl,*.py,*.rb exec ":call MySetTitle()"
function! MySetTitle()
    if &filetype == 'sh'
        call setline(1, "\#!/usr/bin/env bash")
        call append(line("."),    "\######################################################################")
        call append(line(".")+1,  "\# Copyright (C) 2015 Faurecia (China) Holding Co.,Ltd.               #")
        call append(line(".")+2,  "\# All rights reserved                                                #")
        call append(line(".")+3,  "\# Name: ".expand("%"))
        call append(line(".")+4,  "\# Author: Canux canuxcheng@gmail.com                                 #")
        call append(line(".")+5,  "\# Version: V1.0                                                      #")
        call append(line(".")+6,  "\# Time: ".strftime("%c"))
        call append(line(".")+7,  "\######################################################################")
        call append(line(".")+8,  "\# Description:")
        call append(line(".")+9,  "\######################################################################")
        call append(line(".")+10, "")
    endif
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(line("."),    "\# -*- coding: utf-8 -*-")
        call append(line(".")+1,  "\######################################################################")
        call append(line(".")+2,  "\# Copyright (C) 2015 Faurecia (China) Holding Co.,Ltd.               #")
        call append(line(".")+3,  "\# All rights reserved                                                #")
        call append(line(".")+4,  "\# Name: ".expand("%"))
        call append(line(".")+5,  "\# Author: Canux canuxcheng@gmail.com                                 #")
        call append(line(".")+6,  "\# Version: V1.0                                                      #")
        call append(line(".")+7,  "\# Time: ".strftime("%c"))
        call append(line(".")+8,  "\######################################################################")
        call append(line(".")+9,  "\# Description:")
        call append(line(".")+10, "\######################################################################")
        call append(line(".")+11, "")
    endif
    if &filetype == 'perl'
        call setline(1, "\#!/usr/bin/env perl")
        call append(line("."),    "\######################################################################")
        call append(line(".")+1,  "\# Copyright (C) 2015 Faurecia (China) Holding Co.,Ltd.               #")
        call append(line(".")+2,  "\# All rights reserved                                                #")
        call append(line(".")+3,  "\# Name: ".expand("%"))
        call append(line(".")+4,  "\# Author: Canux canuxcheng@gmail.com                                 #")
        call append(line(".")+5,  "\# Version: V1.0                                                      #")
        call append(line(".")+6,  "\# Time: ".strftime("%c"))
        call append(line(".")+7,  "\######################################################################")
        call append(line(".")+8,  "\# Description:")
        call append(line(".")+9,  "\######################################################################")
        call append(line(".")+10, "")
    endif
    if &filetype == 'ruby'
        call setline(1, "\#!/usr/bin/env ruby")
        call append(line("."),    "\######################################################################")
        call append(line(".")+1,  "\# Copyright (C) 2015 Faurecia (China) Holding Co.,Ltd.               #")
        call append(line(".")+2,  "\# All rights reserved                                                #")
        call append(line(".")+3,  "\# Name: ".expand("%"))
        call append(line(".")+4,  "\# Author: Canux canuxcheng@gmail.com                                 #")
        call append(line(".")+5,  "\# Version: V1.0                                                      #")
        call append(line(".")+6,  "\# Time: ".strftime("%c"))
        call append(line(".")+7,  "\######################################################################")
        call append(line(".")+8,  "\# Description:")
        call append(line(".")+9,  "\######################################################################")
        call append(line(".")+10, "")
    endif
    if &filetype == 'h'
        call setline(1, "/*********************************************************************")
        call append(line("."),   "* Copyright (C) 2015 Faurecia (China) Holding Co.,Ltd.               *")
        call append(line(".")+1, "* All right reserved.                                                *")
        call append(line(".")+2, "* Name: ".expand("%"))
        call append(line(".")+3, "* Author: Canux canuxcheng@gmail.com                                 *")
        call append(line(".")+4, "* Version: V1.0                                                      *")
        call append(line(".")+5, "* Time: ".strftime("%c"))
        call append(line(".")+6, "**********************************************************************")
        call append(line(".")+7, "* Description:                                                        ")
        call append(line(".")+8, "*********************************************************************/")
        call append(line(".")+9, "")
    endif
    if &filetype == 'c'
        call setline(1, "/*********************************************************************")
        call append(line("."),   "* Copyright (C) 2015 Faurecia (China) Holding Co.,Ltd.               *")
        call append(line(".")+1, "* All right reserved.                                                *")
        call append(line(".")+2, "* Name: ".expand("%"))
        call append(line(".")+3, "* Author: Canux canuxcheng@gmail.com                                 *")
        call append(line(".")+4, "* Version: V1.0                                                      *")
        call append(line(".")+5, "* Time: ".strftime("%c"))
        call append(line(".")+6, "**********************************************************************")
        call append(line(".")+7, "* Description:                                                        ")
        call append(line(".")+8, "*********************************************************************/")
        call append(line(".")+9, "")
    endif
    if &filetype == 'cpp'
        call setline(1, "/*********************************************************************")
        call append(line("."),   "* Copyright (C) 2015 Faurecia (China) Holding Co.,Ltd.               *")
        call append(line(".")+1, "* All right reserved.                                                *")
        call append(line(".")+2, "* Name: ".expand("%"))
        call append(line(".")+3, "* Author: Canux canuxcheng@gmail.com                                 *")
        call append(line(".")+4, "* Version: V1.0                                                      *")
        call append(line(".")+5, "* Time: ".strftime("%c"))
        call append(line(".")+6, "**********************************************************************")
        call append(line(".")+7, "* Description:                                                        ")
        call append(line(".")+8, "*********************************************************************/")
        call append(line(".")+9, "")
    endif
    if &filetype == 'java'
        call setline(1, "/*********************************************************************")
        call append(line("."),   "* Copyright (C) 2015 Faurecia (China) Holding Co.,Ltd.               *")
        call append(line(".")+1, "* All right reserved.                                                *")
        call append(line(".")+2, "* Name: ".expand("%"))
        call append(line(".")+3, "* Author: Canux canuxcheng@gmail.com                                 *")
        call append(line(".")+4, "* Version: V1.0                                                      *")
        call append(line(".")+5, "* Time: ".strftime("%c"))
        call append(line(".")+6, "**********************************************************************")
        call append(line(".")+7, "* Description:                                                        ")
        call append(line(".")+8, "*********************************************************************/")
        call append(line(".")+9, "")
    endif
    autocmd BufNewFile * normal G
endfunc
