lua << EOF
local present, true_zen = pcall(require, "true-zen")
if not present then
	return
end

true_zen.setup({
	integrations = {
		vim_gitgutter = false,
		galaxyline = false,
		tmux = true,
		gitsigns = false,
		nvim_bufferline = false,
		limelight = false,
		twilight = false,
		vim_airline = false,
		vim_powerline = false,
		vim_signify = false,
		express_line = false,
		lualine = true,
		lightline = false,
		feline = false
	}
})
EOF
