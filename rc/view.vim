" 背景を黒ベースに
set background=dark

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
