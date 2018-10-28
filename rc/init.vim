" Python 3
if executable('/usr/local/bin/python3')
	let g:python3_host_prog = '/usr/local/bin/python3'
elseif executable($PYENV_ROOT . '/shims/python3')
	let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'
elseif executable('/usr/bin/python3')
	let g:python3_host_prog = '/usr/bin/python3'
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
