let g:dein#install_max_processes = 16
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = g:true

let s:dein = {'dir': expand('$DATA/dein'), 'config': expand('$CONFIG/nvim/dein')}

if !dein#load_state(s:dein.dir)
	finish
endif

let s:dein.toml = {
			\ 'base': s:dein.config . '/base.toml',
			\ 'lazy': s:dein.config . '/lazy.toml',
			\ 'input': s:dein.config . '/input.toml',
			\ }

call dein#begin(s:dein.dir, add(values(s:dein.toml), expand('<sfile>')))

call dein#load_toml(s:dein.toml.base, {'lazy': 0})
call dein#load_toml(s:dein.toml.lazy, {'lazy': 1})
call dein#load_toml(s:dein.toml.input, {'lazy': 1})

call dein#end()
call dein#save_state()

if !has('vim_starting') && dein#check_install()
  " Installation check.
  call dein#install()
endif
