"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------

nnoremap [Space] <Nop>
nmap <Space> [Space]

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
nmap [Space]w [Window]

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
