" Reset
augroup MyAutoCmd
	autocmd!
augroup END

" ENV
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

let g:false = 0
let g:true = 1


" init
if has('vim_starting')
	" Python 3
	if executable('/usr/bin/python3')
		let g:python3_host_prog = '/usr/bin/python3'
	elseif executable($PYENV_ROOT . '/shims/python3')
		let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
	elseif executable('/usr/local/bin/python3')
		let g:python3_host_prog = '/usr/local/bin/python3'
	endif

	if &runtimepath !~# '/dein.vim'
		let s:dein_repo_dir = expand('$DATA/dein/repos/github.com/Shougo/dein.vim')

		" Auto Download
		if !isdirectory(s:dein_repo_dir)
			execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
		endif

		execute 'set runtimepath^=' . s:dein_repo_dir
	endif

	" Disable packpath
	set packpath=

	" Disable default plugins
	let g:loaded_gzip = 1
	let g:loaded_tar = 1
	let g:loaded_tarPlugin = 1
	let g:loaded_zip = 1
	let g:loaded_zipPlugin = 1
	let g:loaded_ruby_provider = 1
	let g:loaded_node_provider = 1
endif


" plugins
let g:dein#install_max_processes = 16
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = g:true

let s:dein = {'dir': expand('$DATA/dein'), 'config': expand('$CONFIG/nvim/dein')}

if dein#load_state(s:dein.dir)
	let s:dein.toml = {
				\ 'base': s:dein.config . '/base.toml',
				\ 'lazy': s:dein.config . '/lazy.toml',
				\ 'input': s:dein.config . '/input.toml',
				\ }

	call dein#begin(s:dein.dir, [expand('<sfile>'), s:dein.toml.base, s:dein.toml.lazy, s:dein.toml.input])

	call dein#load_toml(s:dein.toml.base, {'lazy': 0})
	call dein#load_toml(s:dein.toml.lazy, {'lazy': 1})
	call dein#load_toml(s:dein.toml.input, {'lazy': 1})

	call dein#end()
	call dein#save_state()

	if !has('vim_starting') && dein#check_install()
		" Installation check.
		call dein#install()
	endif
endif


" option
" Use sh.
" It is faster
set shell=sh

" コマンドラインの履歴を10000件保存する
"set history=10000

" マウスを有効化
set mouse=a

" Clipboard
set clipboard+=unnamedplus

" Open Vim internal help by K command
set keywordprg=:help

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

" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent

" }}}
" ファイル処理関連 {{{

" 保存されていないファイルがあるときは終了前に保存確認
set confirm

" 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set hidden

" 外部でファイルに変更がされた場合は読みなおす
"set autoread
"autocmd MyAutoCmd FocusGained * checktime

" ファイル保存時にバックアップファイルを作らない
set nobackup

" Swap
set noswapfile

" ファイル文末の改行を勝手に変更しない
if exists('+fixeol')
	set nofixendofline
endif

" }}}

" 行番号を表示する
set number

" 行番号を相対的に表示
" Insert モードのみ絶対番号
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
augroup END

" 2バイト文字を描画する
set ambiwidth=double

" メッセージ表示欄を1行確保
set cmdheight=1

" 不可視文字を表示
set list listchars=tab:¦\ ,trail:･

" Enable true color
if exists('+termguicolors')
	set termguicolors
endif

" Emoji
set emoji

" エディタの分割方向を設定する
set splitbelow
set splitright

" 折りたたみ
set foldcolumn=4
set foldmethod=marker

" カーソル {{{

" カーソル位置のカラムの背景色を変える
set cursorcolumn

" カーソル行の背景色を変える
set cursorline

" カーソルの形状を変える
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" }}}

"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------

nnoremap [git] <Nop>
nmap <Space>g [git]

" MiddleMouse の無効化
map <MiddleMouse> <Nop>
map <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map <4-MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>
imap <2-MiddleMouse> <Nop>
imap <3-MiddleMouse> <Nop>

" EXモード: 無効化
nnoremap q <Nop>
nnoremap Q <Nop>

" Y: 行末までヤンク
nnoremap Y y$

" +/-: 数字を変化させる
nnoremap + <C-a>
nnoremap - <C-x>

" <Esc><Esc>: ハイライトの切り替え
nnoremap <silent> <Esc><Esc> :<C-u>set nohlsearch!<CR>

" <ESC>: terminalモードからコマンドモードに変更
tnoremap <silent> <ESC> <C-\><C-n>

" Window {{{
nnoremap [Window] <Nop>
nmap <Space>w [Window]

" 分割
nnoremap <silent> [Window]s :<C-u>split<CR>
nnoremap <silent> [Window]v :<C-u>vsplit<CR>

" 移動
nnoremap <silent> [Window]h <C-w>h
nnoremap <silent> [Window]j <C-w>j
nnoremap <silent> [Window]k <C-w>k
nnoremap <silent> [Window]l <C-w>l
nnoremap <silent> [Window]H <C-w>H
nnoremap <silent> [Window]J <C-w>J
nnoremap <silent> [Window]K <C-w>K
nnoremap <silent> [Window]L <C-w>L
" }}}

" C-s: Save
inoremap <C-S> <C-O>:update<CR>
" C-z: Undo
inoremap <C-Z> <C-O>u
" C-c: Copy
vnoremap <C-C> "+y
" C-x: Cut
vnoremap <C-X> "+x

" Toggle paste
set pastetoggle=<F2>
