-------------------------------------------------------------------------------
-- コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
-- map/noremap           @            -              -                  @
-- nmap/nnoremap         @            -              -                  -
-- imap/inoremap         -            @              -                  -
-- cmap/cnoremap         -            -              @                  -
-- vmap/vnoremap         -            -              -                  @
-- map!/noremap!         -            @              @                  -
-------------------------------------------------------------------------------

vim.api.nvim_set_keymap('n', '<CR>', ':<C-u>call append(".", "")<CR>', {noremap = true, silent = true} )
vim.api.nvim_set_keymap( 'n', '<Tab>', ':bnext<CR>', {noremap = true, silent = true} )

--  MiddleMouse の無効化
vim.api.nvim_set_keymap('', '<MiddleMouse>', '<Nop>', {})
vim.api.nvim_set_keymap('', '<2-MiddleMouse>', '<Nop>', {})
vim.api.nvim_set_keymap('', '<3-MiddleMouse>', '<Nop>', {})
vim.api.nvim_set_keymap('', '<4-MiddleMouse>', '<Nop>', {})
vim.api.nvim_set_keymap('i', '<MiddleMouse>', '<Nop>', {})
vim.api.nvim_set_keymap('i', '<2-MiddleMouse>', '<Nop>', {})
vim.api.nvim_set_keymap('i', '<3-MiddleMouse>', '<Nop>', {})

-- EXモード: 無効化
vim.api.nvim_set_keymap('n', 'q', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('n', 'Q', '<Nop>', {noremap = true})

-- Y: 行末までヤンク
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

-- +/-: 数字を変化させる
vim.api.nvim_set_keymap('n', '+', '<C-a>', {noremap = true})
vim.api.nvim_set_keymap('n', '-', '<C-x>', {noremap = true})

-- <Esc><Esc>: ハイライトの切り替え
vim.api.nvim_set_keymap('n', '<Esc><Esc>', ':<C-u>set nohlsearch!<CR>', {noremap = true, silent = true})

-- <ESC>: terminalモードからコマンドモードに変更
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', {noremap = true, silent = true})

-- Window {{{
vim.api.nvim_set_keymap('n', '[Window]', '<Nop>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Space>w', '[Window]', {})

-- 分割
vim.api.nvim_set_keymap('n', '[Window]s', ':<C-u>split<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[Window]w', ':<C-u>vsplit<CR>', {noremap = true, silent = true})

-- 移動
vim.api.nvim_set_keymap('n', '[Window]h', ':<C-u>h', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[Window]j', ':<C-u>j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[Window]k', ':<C-u>k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[Window]l', ':<C-u>L', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[Window]H', ':<C-u>H', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[Window]J', ':<C-u>J', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[Window]K', ':<C-u>K', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[Window]L', ':<C-u>L', {noremap = true, silent = true})
-- }}}
