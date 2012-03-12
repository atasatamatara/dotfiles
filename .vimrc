"=================================================
"NeoBundleでの初期設定"
"=================================================
"NeoBundleの初期設定
"mkdir ~/.bundle
"NeoBundleは git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/neobundle.vim しておく
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim

  call neobundle#rc(expand('~/.vim'))
endif

"=================================================
"pluginの設定
"=================================================
"
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
"NeoBundle
"プラグイン管理をgitベースで行う
"install :NeoBundleInstall
nnoremap <silent> ,nbi :<C-u>NeoBundleInstall<CR>
"install & update :NeoBundleInstall!
nnoremap <silent> ,nbI :<C-u>NeoBundleInstall!<CR>
"clean :NeoBundleClean
nnoremap <silent> ,nbc :<C-u>NeoBundleClean<CR>

NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"neocomplcaceh
"neocomplcacehを有効にする
let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_dictionary_filetype_lists = {
"   \ 'default' : '',
"   \ 'javascript' : $HOME.'/dotfiles/vimfiles/javascript.dict' $HOME.'/dotfiles/vimfiles/jQuery.dict',
"   \ 'html' : $HOME.'/.vim/javascript.dict',
"   \}
"2つの辞書を登録する
autocmd FileType html setlocal dictionary=$HOME/dotfiles/vimfiles/javascript.dict,$HOME/dotfiles/vimfiles/jQuery.dict
autocmd FileType javascript setlocal dictionary=$HOME/dotfiles/vimfiles/javascript.dict,$HOME/dotfiles/vimfiles/jQuery.dict

"neocomplcacheのオムニ補完
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"英語補完
"うまく動かない？
NeoBundle 'https://github.com/ujihisa/neco-look.git'

NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete.git'
"neocomplcache
"ネオコンのスニペット展開
imap <C-k> <Plug>(neocomplcache_snippets_expand)

NeoBundle 'git://github.com/Shougo/vimfiler.git'
"vimfilerをデフォルトにする
"let g:vimfiler_as_default_explorer = 1
",eでVimFilerの起動
nnoremap <silent>,e :<C-u>VimFiler<CR>
"nnoremap <silent>,e :!cd %:h<CR>:VimFilerCurrentDir<cr>

NeoBundle 'git://github.com/Shougo/unite.vim.git'
" unite.vim
" 隠しファイル(.で始まるファイル)を表示するには /hoge/. と直接入力が必要
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> fb :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ff :<C-u>UniteWithBufferDir -buffer-name=dotfiles file<CR>
" レジスタ一覧
nnoremap <silent> fr :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> fm :<C-u>Unite file_mru<CR>
" 常用セット
"nnoremap <silent> fu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
"jnnoremap <silent> fa :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
"HTMLやXMLなどの賢い展開
let g:user_zen_expandabbr_key = '<c-e>'

NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
"NERDCommenter Toggle
nmap ,c <Plug>NERDCommenterToggle
vmap ,c <Plug>NERDCommenterToggle

NeoBundle 'taglist.vim'
"ctags で生成した各種宣言を表示 :Tlist
"taglist Macの /usr/bin/ctags は消すこと
set tags=tags

"異なるvim間でのyank共有
NeoBundle 'yanktmp.vim'
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

NeoBundle 'sudo.vim'
"vi sudo:/etc/nginx/nginx.conf などと使う
"現在開いているファイルをsudoで開くには :e sudo:%
"
NeoBundle 'nginx.vim'
"nginxのsyntax
"nginx.vim
au BufRead,BufNewFile /etc/nginx/* set ft=nginx

"minibuffer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBuffs = 1


"=================================================
"colorscheme
"=================================================
"molokai
NeoBundle 'molokai'
"desert
NeoBundle 'desert.vim'
"desert256
NeoBundle 'desert256.vim'
"ir_black
NeoBundle 'git://github.com/wgibbs/vim-irblack.git'

"=================================================
"通常設定"
"=================================================
syntax on
filetype plugin on
set encoding=utf-8
"256色カラー。各種ターミナルとVimとtmuxやscreenが対応している必要がある
set t_Co=256
colorscheme molokai

"新しい行のインデントを現在行と同じにする
"set autoindent
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイルをつくらない
set noswapfile
set nobackup
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan
"検索のハイライト
set hlsearch

""ハイライトをEscで抜ける
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
"autocmd BufWritePre * :%s/\t/  /ge

" カッコなどを挿入したら自動的に中へ
inoremap {{ {}<LEFT>
inoremap (( ()<LEFT>
inoremap "" ""<LEFT>
inoremap '' ''<LEFT>
inoremap << <><LEFT>
inoremap {% {%<Space><Space>%}<LEFT><LEFT><LEFT>
inoremap [[ []<LEFT>

"Tabでウィンドウの移動
nnoremap <silent><Tab> <C-w>w

">や<で幅調節
nnoremap <silent>> <C-w>>
nnoremap <silent>< <C-w><
"
"tn で新しいタブを開く。移動はgt
nnoremap <silent>tn :<C-u>:tabnew<CR>

"FileType
"シフト移動幅
"ファイル内の <Tab> が対応する空白の数
autocmd FileType * set tabstop=2 shiftwidth=2
autocmd FileType javascript set tabstop=2 shiftwidth=2
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType python set tabstop=4 shiftwidth=4

"gfでのファイル移動
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/',',') | setlocal path+=;/''
