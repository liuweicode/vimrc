" ------------------------------------------------------------------------------------------
" https://github.com/junegunn/vim-plug
call plug#begin()

Plug 'preservim/nerdtree'
" Shows Git status flags for files and folders in NERDTree.
Plug 'Xuyuanp/nerdtree-git-plugin'
" Adds filetype-specific icons to NERDTree files and folders
Plug 'ryanoasis/vim-devicons'

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'joker1007/vim-markdown-quote-syntax'
Plug 'ferrine/md-img-paste.vim'
Plug 'preservim/vim-markdown'
Plug 'dhruvasagar/vim-table-mode'

" 输入法自动切换
Plug 'lyokha/vim-xkbswitch'

" https://www.arthurkoziel.com/setting-up-vim-for-yaml/
Plug 'Yggdroot/indentLine'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'dense-analysis/ale'

" 通用
Plug 'tpope/vim-surround'
Plug 'gcmt/wildfire.vim'
Plug 'lfv89/vim-interestingwords'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ycm-core/YouCompleteMe'
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/csv.vim'

Plug 'junegunn/vim-peekaboo'

call plug#end()

" --------------------------------------------------------------------------------------------
"  https://github.com/preservim/nerdtree
" --------------------------------------------------------------------------------------------
" Start NERDTree. If a file is specified, move the cursor to its window.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" window size
let g:NERDTreeWinSize=40
" window show line number
let g:NERDTreeShowLineNumbers=1
" don't show hidden files
let g:NERDTreeShowHidden=0
" Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif" 打卡文件所在目录
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <CS-f> :NERDTreeFind<CR>
inoremap <C-f> <ESC>:NERDTreeFind<CR>

" --------------------------------------------------------------------------------------------
"  https://github.com/Xuyuanp/nerdtree-git-plugin
" --------------------------------------------------------------------------------------------
set shell=sh
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

" --------------------------------------------------------------------------------------------
"  https://github.com/ryanoasis/vim-devicons
" --------------------------------------------------------------------------------------------


" --------------------------------------------------------------------------------------------
"  https://github.com/Yggdroot/indentLine
" --------------------------------------------------------------------------------------------
"let g:indentLine_setColors = 0
let g:indentLine_char = '¦'
let g:indentLine_color_term = 239
"let g:indentLine_enabled = 0
let g:markdown_syntax_conceal=0
let g:vim_json_conceal=0
" https://www.arthurkoziel.com/setting-up-vim-for-yaml/
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType markdown let g:indentLine_enabled = 0

set foldlevelstart=20

" --------------------------------------------------------------------------------------------
"  https://github.com/ferrine/md-img-paste.vim 
" --------------------------------------------------------------------------------------------
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'attachments'
let g:mdip_imgname = 'temp'

" --------------------------------------------------------------------------------------------
"  https://github.com/iamcco/markdown-preview.nvim
" --------------------------------------------------------------------------------------------
let g:mkdp_markdown_css = '/Users/liuwei/markdown.css'
autocmd FileType markdown nnoremap <silent> <C-s> :MarkdownPreview<CR>
autocmd FileType markdown inoremap <silent> <C-s> <esc>:MarkdownPreview<CR>

" --------------------------------------------------------------------------------------------
"  https://github.com/preservim/vim-markdown
" --------------------------------------------------------------------------------------------
let g:vim_markdown_folding_disabled=1 " Disable Folding

" --------------------------------------------------------------------------------------------
"  https://github.com/itchyny/lightline.vim
" --------------------------------------------------------------------------------------------
set laststatus=2

" --------------------------------------------------------------------------------------------
"  https://github.com/lyokha/vim-xkbswitch
" --------------------------------------------------------------------------------------------
let g:XkbSwitchEnabled = 1

" --------------------------------------------------------------------------------------------
"  https://github.com/gcmt/wildfire.vim
" --------------------------------------------------------------------------------------------
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i`", "i|", "ip", "it"]

" --------------------------------------------------------------------------------------------
"  https://github.com/junegunn/fzf
" --------------------------------------------------------------------------------------------
nnoremap <C-L> <esc>:FZF /Users/liuwei/Documents<CR>
"nnoremap <leader>b :Buffers<CR>

" --------------------------------------------------------------------------------------------
"  https://github.com/ycm-core/YouCompleteMe
" --------------------------------------------------------------------------------------------
let g:syntastic_java_checkers = []
let g:EclimFileTypeValidate = 0
" Use homebrew's clangd
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

" --------------------------------------------------------------------------------------------
"  https://github.com/dense-analysis/ale
" --------------------------------------------------------------------------------------------
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
"let g:ale_lint_on_enter = 0


" --------------------------------------------------------------------------------------------
"  https://github.com/chrisbra/csv.vim
" --------------------------------------------------------------------------------------------
if exists("did_load_csvfiletype")
  finish
endif
let did_load_csvfiletype=1

augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat	setfiletype csv
augroup END

" --------------------------------------------------------------------------------------------
"  公共配置
" --------------------------------------------------------------------------------------------
let mapleader = "\<space>"
set encoding=UTF-8
set nocompatible
inoremap jj <esc>
set ts=4
" 解决backspace按键失效问题
set backspace=2
" 把所有数字当10进制
set nrformats=
set number 
"set relativenumber 
" 折叠
set foldmethod=indent
set nofoldenable 

" --------------------------窗口设置----------------------------
" 设置命令行高度
set cmdheight=2
set ruler " 打开状态栏标尺
set shiftwidth=4 " 设定 << 和 >> 命令移动时的宽度为 4

" --------------------------复制粘贴----------------------------
set clipboard=unnamed
"粘贴时保持格式
set paste

" --------------------------常用快捷键----------------------------
" reselect pasted text
nnoremap gp `[v`]
vnoremap cp "0p

" --------------------------搜索相关开始----------------------------
" 搜索关键词高亮
set hlsearch
"在搜索的时候忽略大小写
set ignorecase
" 如果有一个大写字母，则切换到大小写敏感查找
set smartcase 
" 指定 Search 结果的前景色（foreground）为黑色，背景色（background）为灰色； 渐进搜索的前景色为黑色，背景色为黄色；光标处的字符加下划线
highlight Search ctermbg=yellow ctermfg=black 
highlight IncSearch ctermbg=black ctermfg=yellow 
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE
 
" 允许鼠标点击定位 坚决不允许！！
"set mouse=a
