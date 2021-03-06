" =================================================
" 初期設定
" =================================================
" NeoBundleの初期設定
" mkdir ~/.vim
" NeoBundleは git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/neobundle.vim しておく
set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim
endif

call neobundle#rc(expand('~/.vim'))

" let OSTYPE = system("uname")
" =================================================
" 補完、変換、展開、入力
" =================================================

" NeoBundle
" プラグイン管理をgitベースで行う
NeoBundleFetch 'git://github.com/Shougo/neobundle.vim.git'
" install :NeoBundleInstall
nnoremap <silent> ,nbi :<C-u>NeoBundleInstall<CR>
" install & update :NeoBundleInstall!
nnoremap <silent> ,nbI :<C-u>NeoBundleInstall!<CR>
" clean :NeoBundleClean
nnoremap <silent> ,nbc :<C-u>NeoBundleClean<CR>

" Lua for Mac
if has('mac')
  let $LUA_DLL='/usr/local/lib/liblua.dylib'
endif

" neocomplcache
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
" neocomplcaceheを無効にする
let g:neocomplcache_enable_at_startup = 0

" neocomplete
NeoBundle 'Shougo/neocomplete'
" neocomplcaceheを有効にする
let g:neocomplete#enable_at_startup = 1

" なんか公式にある
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" 1文字目から補完を始める
let g:neocomplcache_auto_completion_start_length = 1
" 辞書補完(neocomplcache)
let g:neocomplcache_dictionary_filetype_lists = {
   \ 'default' : '',
   \ 'css' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ 'less' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ 'sass' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ }
" 辞書補完(neocomplete)
let g:neocomplete#sources#dictionary#dictionaries = {
   \ 'default' : '',
   \ 'css' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ 'less' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ 'sass' : $HOME.'/dotfiles/vimfiles/css.dict',
   \ }
" neocomplcacheのオムニ補完
autocmd FileType css,less,sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,htmldjango setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType javascript,coffee setlocal omnifunc=javascriptcomplete#CompleteJS

" neocomplcache
" ネオコンのスニペット展開
NeoBundle 'git://github.com/Shougo/neosnippet.git'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
" snippet の保管場所
let g:neosnippet#snippets_directory='~/dotfiles/vimfiles'

" ()[]{}""''などを挿入したら自動的に中へ
NeoBundle 'git://github.com/kana/vim-smartinput.git'
inoremap << <><LEFT>
inoremap {% {%<Space><Space>%}<LEFT><LEFT><LEFT>

" template
autocmd BufNewFile *.py 0r $HOME/dotfiles/vimfiles/templates.py

" coffeescript
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'
autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

" python virtualenv
NeoBundle "git://github.com/jmcantrell/vim-virtualenv.git"

" 英語補完
NeoBundle 'https://github.com/ujihisa/neco-look.git'

" ctags で生成した各種宣言を表示 :Tlist
" taglist Macの /usr/bin/ctags は消すこと
NeoBundle 'taglist.vim'
set tags=tags

" HTMLやXMLなどの賢い展開
NeoBundle 'https://github.com/mattn/emmet-vim.git'
let g:user_emmet_expandabbr_key = '<c-e>'

" Quickfix での置換
NeoBundle "git://github.com/thinca/vim-qfreplace.git"
nnoremap <silent>qf :Qfreplace<CR>

" NERDCommenter トグルでコメント/コメントアウト
NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
nmap ,c <Plug>NERDCommenterToggle
vmap ,c <Plug>NERDCommenterToggle


" make jsdoc
" call function :JsDoc
NeoBundle 'git://github.com/heavenshell/vim-jsdoc.git'
" =================================================
" Syntax
" =================================================
" 全体のインデントをマッピング
nnoremap <silent>,in gg=G<CR>

" haml Sassのインデント、色付け
NeoBundle 'git://github.com/tpope/vim-haml.git'

" JavaScript indent
" =G で末尾まで自動インデント
NeoBundle 'git://github.com/vim-scripts/JavaScript-Indent.git'

"force pep8 indent
NeoBundle 'https://github.com/hynek/vim-python-pep8-indent.git'
let g:pymode_indent = 0

" Markdown
NeoBundle 'git://github.com/tpope/vim-markdown.git'

" reST (ft=rst)
NeoBundle 'git://github.com/vim-scripts/rest.vim.git'
autocmd FileType rst setlocal foldmethod=marker

" Python
" http://slowquery.hatenablog.com/entry/2013/04/30/020630 etc ...
NeoBundle 'vim-scripts/Flake8-vim'
"保存時に自動でチェック(off)
let g:PyFlakeOnWrite = 0
nnoremap <silent>,fc :PyFlake<CR>
"解析種別を設定
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
"McCabe複雑度の最大値
let g:PyFlakeDefaultComplexity=10
"visualモードでQを押すと自動で修正(defalut)
let g:PyFlakeRangeCommand = 'Q'
" 全部修正
nnoremap <silent>,flake :PyFlakeAuto<CR>

" nginxのsyntax
NeoBundle 'nginx.vim'
au BufRead,BufNewFile /etc/nginx/* set ft=nginx

" blockdiag
NeoBundle 'git://github.com/aohta/blockdiag.vim.git'

" 各種構文チェックしてくれるらしい
NeoBundle 'git://github.com/scrooloose/syntastic.git'

" javascript は jshint
" python は flake8
" PHP はてきとう
let g:syntastic_check_on_open=1
let g:syntastic_python_checkers=['flake8']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['python', 'javascript', 'php'],
                           \ 'passive_filetypes': [] }
" =================================================
" Filer、参照
" =================================================

" VimFiler
NeoBundle 'git://github.com/Shougo/vimfiler.git'
" vimfilerをデフォルトにしない
let g:vimfiler_as_default_explorer = 0
let g:vimfiler_safe_mode_by_default = 0
" ,eでVimFilerの起動
nnoremap <silent>,e :<C-u>VimFilerBufferDir<CR>

" unite.vim
NeoBundle 'git://github.com/Shougo/unite.vim.git'
" 隠しファイル(.で始まるファイル)を表示するには /hoge/. と直接入力が必要
" 入力モードで開始する
" let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> fb :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ff :<C-u>UniteWithBufferDir -buffer-name=dotfiles file<CR>
" 最近使用したファイル一覧
nnoremap <silent> fm :<C-u>Unite file_mru<CR>
" ctrips 的ななにか
nnoremap <silent> fa :<C-u>execute
      \ 'Unite'
      \ '-start-insert'
      \ 'buffer file_mru'
      \ 'file:'.fnameescape(expand('%:p:h'))
      \ 'file_rec:!:'.fnameescape(expand('%:p:h'))
      \ <CR>

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
"nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
"nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" Ag.vim
" Macの場合 brew install the_silver_searcher
" Ubuntuの場合 https://github.com/ggreer/the_silver_searcher から build
" :Ag [options] {patterns} [{directory}]
NeoBundle 'git://github.com/rking/ag.vim.git'
let g:agprg="ag --nocolor --nogroup --column"

" 現在開いているバッファへ作業ディレクトリ(カレントディレクトリ)の変更するマッピング
nnoremap <silent> cd :cd %:h<CR>

" カレンダー
" :Calender
NeoBundle 'git://github.com/mattn/calendar-vim.git'

" =================================================
" その他
" =================================================
" 非同期処理ライブラリ
" neocomplcache の補完を非同期にするため
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" 異なるvim間でのyank共有
NeoBundle 'yanktmp.vim'
map <silent> sy :call YanktmpYank()<CR>
map <silent> sp :call YanktmpPaste_p()<CR>
map <silent> sP :call YanktmpPaste_P()<CR>

" -clipboard でもクリップボード
" xsel を使うけど、いちおう
NeoBundle "git://github.com/kana/vim-fakeclip.git"
" X CUI 環境でもクリップボード
vmap <C-c> :w !xsel -ib<CR><CR>

" 現在開いているファイルをsudoで開く :e sudo:%
" 編集前のファイブバッファを消す <C-^>:bd!
NeoBundle 'sudo.vim'
nnoremap <silent>,sudo :e sudo:%<CR><C-^>:bd!

" \r で現在開いているスクリプトを実行
NeoBundle 'git://github.com/thinca/vim-quickrun.git'

" 一時ファイルの作成
" :JunkfileOpen
" filetype は自前でつけてやる
NeoBundle 'git://github.com/Shougo/junkfile.vim.git'
" http://vim-users.jp/2009/12/hack108/
" let g:junkfile#directory=path/to/local/.vim_junk"
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" =================================================
" colorschemeとか見た目とか
" =================================================
" molokai
NeoBundle 'molokai'
" ir_black
NeoBundle 'git://github.com/wgibbs/vim-irblack.git'

" 256色モード
set t_Co=256
" 256色カラーは各種ターミナルとVimとtmuxやscreenが対応している必要がある
colorscheme molokai

" ステータスラインをちょろっとする
NeoBundle 'bling/vim-airline'
NeoBundle 'itchyny/landscape.vim'
let g:airline_theme="landscape"
" ステータスラインを常に表示
set laststatus=2

" インデントに色付け
NeoBundle "git://github.com/nathanaelkane/vim-indent-guides.git"

" 起動時から使用
let g:indent_guides_enable_on_vim_startup = 1
" 手動で色設定
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * : highlight IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * : highlight IndentGuidesEven ctermbg=black

" カレント行ハイライト
set cursorline
" アンダーラインをひく
autocmd VimEnter,ColorScheme * : highlight CursorLine cterm=underline ctermbg=234

filetype plugin indent on

" =================================================
" 通常設定
" =================================================
syntax on
filetype plugin on
set encoding=utf-8

" 新しい行のインデントを現在行と同じにする
" set autoindent
" ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer
" クリップボードと連携
" +clipboard 必要
set clipboard=unnamed
" コマンドモードの補完とか
set nocompatible
" コマンドモードの補完表示
set wildmode=longest:full,full
" スワップファイルをつくらない
set noswapfile
set nobackup
set nowritebackup
" タブの代わりに空白文字を挿入する
set expandtab
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" インクリメンタルサーチを行う
set incsearch
" タブ文字、行末など不可視文字を表示する
set list
" タブ文字を表示。行末(eol)は非表示
set listchars=tab:>\
" 行番号を表示する
set number
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" 検索時に大文字を含んでいたら大/小を区別
set smartcase
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 検索をファイルの先頭へループしない
set nowrapscan
" 検索のハイライト
set hlsearch

" ハイライトをEscで抜ける
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" Tabでウィンドウの移動
nnoremap <silent><Tab> <C-w>w

" >や<で幅調節
nnoremap <silent>> <C-w>>
nnoremap <silent>< <C-w><
"
" tn で新しいタブを開く。移動はgt
nnoremap <silent>tn :<C-u>:tabnew<CR>

" FileType
" シフト移動幅
" ファイル内の <Tab> が対応する空白の数
autocmd FileType * set tabstop=2 shiftwidth=2
autocmd FileType javascript set tabstop=2 shiftwidth=2
autocmd FileType html set tabstop=2 shiftwidth=2
autocmd FileType python set tabstop=4 shiftwidth=4
autocmd FileType coffee set tabstop=4 shiftwidth=4
autocmd FileType sass set tabstop=4 shiftwidth=4

" html で gf でのファイル移動
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/',',') | setlocal path+=;/''
