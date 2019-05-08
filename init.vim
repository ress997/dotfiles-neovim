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

function! s:load(file) abort
	let s:path = expand('$CONFIG/nvim/rc/' . a:file . '.vim')

	if filereadable(s:path)
		execute 'source' fnameescape(s:path)
	endif
endfunction

if has('vim_starting')
	call s:load('init')
endif

call s:load('plugins')

call s:load('options')

call s:load('view')

call s:load('key')

filetype plugin indent on
