"todo list
"配置visual模式下，选择一键注释功能
set fencs=utf-8,gbk
set fileencoding=gb18030
set fileencodings=utf-8,gb18030,utf-16,big5

syntax on   "语法高亮

syntax enable   "打开色彩
set bg=dark

set mouse=a "启动鼠标
:behave mswin "make mouse like MS

set ai "普通文件的缩进

set showmatch "括号匹配
set nu  "显示行号

set numberwidth=4
set shiftwidth=4 "缩进距离

set wrap    "拆行

set smartindent "智能对齐
"set whichwrap=+h,l  "hl能够换行
"set expandtab "使得文件没有tab 转换为空格
filetype plugin on
set autochdir
set tabstop=4 "tab缩进
set helplang=cn
:map <F6> :tabprevious<CR>
:map <F7> :tabnext<CR>
set textwidth=80
set foldmethod=syntax "折叠代码

:map <C-A> ggvG "ctrl + a in normal model
:map! <C-A> <esc>ggvG "ctrl + a in insert model

:map <Tab> > "向右缩进
:map <S-Tab> < "向左缩进 

"复制 粘贴 剪切
:map <C-V> "+pa<esc>
:map! <C-V> <esc>"+pa
:map <C-C> "+y
:map <C-X> "+x

"set Tag list
"===========================================================
"exuberant_ctags
"http://www.vim.org/scripts/script.php?script_id=273
:map <F2> :TlistToggle<CR>
let Tlist_File_Auto_Close=1
let Tlist_lnc_Winwidth=0

"===========================================================

set linebreak
set ignorecase "忽略大小写
set cindent "对C语言的缩进
set fileformats=unix,dos,mac

"set scheme
colorscheme default

"与windows共享剪贴板
"set clipboard+=unnamed

"map
"===========================================================
"insert map ctrl+d = esc dd i
"ctrl+u = esc u i
"zz is quit without save
:imap <c-d> <esc>ddi
:imap <c-u> <esc>ui
:imap <c-r> <esc><c-r>i
:imap qq <esc>
:nnoremap zz :q!<cr>
:nnoremap ss :w<cr>
":nnoremap qq <esc>
:nnoremap L $
:nnoremap H ^
:nnoremap azz :qa!<cr>
:nnoremap JJ <c-w>j
:nnoremap KK <c-w>k
:nnoremap LL <c-w>l
:nnoremap HH <c-w>h
:vmap L $
:vmap H ^

"编辑vimrc文件
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"============================================================

"缩写
:iabbrev chenid ----- <cr>Alps<cr>chenfushan1992@gmail.com
:iabbrev inc #include<><esc>i


"autocommand
"============================================================	
":autocmd BufNewFile * :write
"         ^          ^ ^
"         |          | |
"         |          | The command to run.
"         |          A "pattern" to filter the event.
"         The "event" to watch for.
:autocmd BufNewFile *.txt :write
":autocmd BufWritePre *.html :normal gg=G
"
:autocmd FileType c* :iabbrev ife if()<cr>{<cr>}else<cr>{<cr>}<esc>kkkkk$ww
:autocmd FileType c* :iabbrev for for(int i=;i<;++i)<cr>{<cr>}<esc>kkk$wwww
:autocmd FileType c* :iabbrev while while()<cr>{<cr>}<esc>kkw
:autocmd FileType c* :iabbrev switch switch()<cr>{<cr>}<esc>kkw
:autocmd FileType c* :iabbrev if if()<cr>{<cr>}<esc>kkk$ww
:autocmd FileType c* :iabbrev { {<cr>}<esc>ko
:autocmd FileType cpp :iabbrev class{ class<cr>{<cr>}<esc>kklll
:autocmd FileType python set shiftwidth=4
:autocmd FileType python set tabstop=4
"
":autocmd BufWrite * :echom "writing buffer"
"=============================================================

"Statusline set
"=============================================================
:set laststatus=2
:set statusline=%f\ [FileType:%Y]\ [line:%l/%L]

"=============================================================
"
"vim add on manager : manage the vim pluge
"============================================================
set nocompatible | filetype indent plugin on | syn on

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif
  call vam#ActivateAddons([], {'auto_install' : 0})
endfun

call SetupVAM()
VAMActivate matchit.zip vim-addon-commenting
" use <c-x><c-p> to complete plugin names
"=================================

