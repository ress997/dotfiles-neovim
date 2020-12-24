-- Use sh.
-- It is faster
vim.o.shell = 'sh'

-- コマンドラインの履歴を10000件保存する
vim.o.history = 10000

-- マウスを有効化
vim.o.mouse = 'a'

-- Clipboard
vim.o.clipboard = 'unnamedplus'

-- Open Vim internal help by K command
vim.o.keywordprg = ':help'

-- 行頭行末の左右移動で行をまたぐ
vim.o.whichwrap = 'b,s,h,l,<,>,[,]'

-- Toggle paste
vim.o.pastetoggle = '<F2>'

-- grep {{{
if vim.fn.executable('rg') == 1 then
	-- Use rg (ripgrep)
	vim.o.grepprg = 'rg --no-heading --vimgrep'
	vim.o.grepformat = '%f:%l:%c:%m'
elseif vim.fn.executable('pt') == 1 then
	-- Use pt (The Platinum Searcher)
	vim.o.grepprg = 'pt --nocolor --nogroup --column'
	vim.o.grepformat = '%f:%l:%c:%m'
elseif vim.fn.executable('ag') == 1 then
	-- Use ag (The Silver Searcher)
	vim.o.grepprg = 'ag --vimgrep'
	vim.o.grepformat = '%f:%l:%c:%m'
elseif vim.fn.executable('ack') then
	vim.o.grepprg = 'ack -H --nocolor --nogroup'
	vim.o.grepformat = '%f:%l:%c:%m'
end
-- }}}
-- 検索/置換 {{{

-- 大文字と小文字を区別しない
vim.o.ignorecase = true

-- 大文字と小文字が混在してる場合は区別する
vim.o.smartcase = true

-- 最後尾まで検索を終えたら次の検索で先頭に移る
vim.o.wrapscan = true

-- 置換時 g オプションをデフォルトで有効にする
vim.o.gdefault = true

-- 置換時 プレビュー表示
vim.o.inccommand = 'nosplit'

vim.cmd('augroup incsearch-highlight')
vim.cmd('autocmd!')
vim.cmd('autocmd CmdlineEnter [/\\?] :set hlsearch')
vim.cmd('autocmd CmdlineLeave [/\\?] :set nohlsearch')
vim.cmd('augroup END')

-- }}}
-- タブ/インデント {{{

-- Tabキー押下時のカーソル移動幅
vim.bo.softtabstop = 4

-- タブ入力を複数の空白入力に置き換えない
vim.bo.expandtab = false

-- 画面上でタブ文字が占める幅
vim.bo.tabstop = 4

-- smartindentでずれる幅
vim.bo.shiftwidth = 4

-- 改行時に前の行の構文をチェックし次の行のインデントを増減する
vim.bo.smartindent = true

-- }}}
-- ファイル処理関連 {{{

-- 保存されていないファイルがあるときは終了前に保存確認
vim.o.confirm = true

-- 保存されていないファイルがあるときでも別のファイルを開くことが出来る
vim.o.hidden = true

-- 外部でファイルに変更がされた場合は読みなおす
--vim.o.autoread = true
--vim.cmd('autocmd MyAutoCmd FocusGained * checktime')

-- ファイル保存時にバックアップファイルを作らない
vim.o.backup = false

-- Swap
vim.o.swapfile = false

-- ファイル文末の改行を勝手に変更しない
if vim.fn.exists('+fixeol') == 1 then
	vim.o.fixendofline = false
end

-- }}}

-- 背景を黒ベースに
vim.o.background = 'dark'

-- 行番号を表示する
vim.wo.number = true

-- 行番号を相対的に表示
-- Insert モードのみ絶対番号
vim.cmd('augroup numbertoggle')
vim.cmd('autocmd!')
vim.cmd('autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu | endif')
vim.cmd('autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif')
vim.cmd('augroup END')

-- 2バイト文字を描画する
vim.o.ambiwidth = 'double'

-- メッセージ表示欄を1行確保
vim.o.cmdheight = 1

-- 不可視文字を表示
vim.wo.list = true
vim.o.listchars = 'tab:¦ ,trail:･'

-- Enable true color
if vim.fn.exists('+termguicolors') == 1 and vim.env.TERM_PROGRAM ~= "Apple_Terminal" then
	vim.o.termguicolors = true
end

-- Emoji
vim.o.emoji = true

-- エディタの分割方向を設定する
vim.o.splitbelow = true
vim.o.splitright = true

-- 折りたたみ
vim.wo.foldcolumn = 'auto:3'
vim.wo.foldlevel = 1
vim.wo.foldmethod = 'marker'

-- カーソル {{{

-- カーソル位置のカラムの背景色を変える
vim.wo.cursorcolumn = true

-- カーソル行の背景色を変える
vim.wo.cursorline = true

-- カーソルの形状を変える
vim.o.guicursor = 'n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor'

-- }}}
