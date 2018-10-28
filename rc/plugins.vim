let g:dein#install_max_processes = 16
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = g:true

let s:dein_dir = expand('$DATA/dein')

if !dein#load_state(s:dein_dir)
	finish
endif

call dein#begin(s:dein_dir, expand('<sfile>'))

let s:toml_list = [
			\	'basic',
			\	'lang',
			\	'lang/web',
			\	'tool',
			\	'view',
			\]

if has('python3')
	call add(s:toml_list, 'input')
endif

for file in s:toml_list
	let s:toml_file = expand('$CONFIG/nvim/dein/' . file . '.toml')

	if filereadable(s:toml_file)
		call dein#load_toml(s:toml_file)
	endif
endfor

let s:toml_local = expand('$CONFIG/nvim/dein/local.toml')
if filereadable(s:toml_local)
	call dein#load_toml(s:toml_local)
endif

call dein#end()
call dein#save_state()

if has('vim_starting') && dein#check_install()
	call dein#install()
	call dein#remote_plugins()
endif
