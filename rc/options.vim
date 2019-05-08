" Use sh.
" It is faster
set shell=sh

" コマンドラインの履歴を10000件保存する
set history=10000

" マウスを有効化
set mouse=a

" Clipboard
set clipboard+=unnamedplus

" Open Vim internal help by K command
set keywordprg=:help

" バックスペースキーの有効化
set backspace=indent,eol,start

" 行頭行末の左右移動で行をまたぐ
set whichwrap=b,s,h,l,<,>,[,]

" grep {{{
if executable('rg')
	" Use rg (ripgrep)
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
elseif executable('pt')
	" Use pt (The Platinum Searcher)
	set grepprg=pt\ --nocolor\ --nogroup\ --column
	set grepformat=%f:%l:%c:%m
elseif executable('ag')
	" Use ag (The Silver Searcher)
	set grepprg=ag\ --vimgrep
	set grepformat=%f:%l:%c:%m
elseif executable('ack')
	set grepprg=ack\ -H\ --nocolor\ --nogroup
	set grepformat=%f:%l:%c:%m
endif
" }}}
" 検索/置換 {{{

" 検索文字列をハイライトする
set hlsearch

" インクリメンタルサーチを行う
set incsearch

" 大文字と小文字を区別しない
set ignorecase

" 大文字と小文字が混在してる場合は区別する
set smartcase

" 最後尾まで検索を終えたら次の検索で先頭に移る
set wrapscan

" 置換時 g オプションをデフォルトで有効にする
set gdefault

" 置換時 プレビュー表示
set inccommand=nosplit

augroup incsearch-highlight
	autocmd!
	autocmd CmdlineEnter [/\?] :set hlsearch
	autocmd CmdlineLeave [/\?] :set nohlsearch
augroup END

" }}}
" タブ/インデント {{{

" Tabキー押下時のカーソル移動幅
set softtabstop=4

" タブ入力を複数の空白入力に置き換えない
set noexpandtab

" 画面上でタブ文字が占める幅
set tabstop=4

" smartindentでずれる幅
set shiftwidth=4

" 改行時に前の行のインデントを継続する
set autoindent

" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent

" }}}
" ファイル処理関連 {{{

" 保存されていないファイルがあるときは終了前に保存確認
set confirm

" 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set hidden

" 外部でファイルに変更がされた場合は読みなおす
set autoread
autocmd MyAutoCmd FocusGained * checktime

" ファイル保存時にバックアップファイルを作らない
set nobackup

" Swap
set noswapfile

" ファイル文末の改行を勝手に変更しない
if exists('+fixeol')
	set nofixendofline
endif

" }}}
