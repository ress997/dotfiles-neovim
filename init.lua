-- Reset
vim.cmd('augroup MyAutoCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

if vim.fn.has('vim_starting') == 1 then
	-- Disable packpath
	vim.o.packpath = ''

	-- Disable default plugins
	vim.g.loaded_gzip = 1
	vim.g.loaded_tar = 1
	vim.g.loaded_tarPlugin = 1
	vim.g.loaded_zip = 1
	vim.g.loaded_zipPlugin = 1

	-- Python 2
	vim.g.loaded_python_provider = 0
	-- Python 3
	if vim.fn.executable('/usr/bin/python3') == 1 then
		vim.g.python3_host_prog = '/usr/bin/python3'
	elseif vim.fn.executable(vim.env.PYENV_ROOT .. '/shims/python3') == 1 then
		vim.g.python3_host_prog = vim.env.PYENV_ROOT .. '/shims/python3'
	elseif vim.fn.executable('/usr/local/bin/python3') == 1 then
		vim.g.python3_host_prog = '/usr/local/bin/python3'
	else
		vim.g.loaded_python3_provider = 0
	end
	-- Node.js
	if vim.fn.executable('/usr/bin/neovim-node-host') == 1 then
		vim.g.node_host_prog = '/usr/bin/neovim-node-host'
	else
		vim.g.loaded_node_provider = 0
	end
	-- Ruby
	vim.g.loaded_ruby_provider = 0
	-- Perl
	vim.g.loaded_perl_provider = 0
end

require('dein')
require('option')
require('key')

if vim.fn.filereadable(vim.env.XDG_CONFIG_HOME .. '/nvim/local.vim') == 1 then
	vim.cmd[[source $XDG_CONFIG_HOME/nvim/local.vim]]
end
