lua << EOF
local present, true_zen = pcall(require, "true-zen")
if not present then
	return
end

true_zen.setup({
	integrations = {
		vim_gitgutter = false,
		galaxyline = true,
		tmux = true,
		gitsigns = false,
		nvim_bufferline = false,
		limelight = false,
		twilight = false,
		vim_airline = false,
		vim_powerline = false,
		vim_signify = false,
		express_line = false,
		lualine = false,
		lightline = false,
		feline = false
	}
})
EOF
