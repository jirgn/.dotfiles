lua << EOF
local present, which_key = pcall(require, "which-key")
if not present then
	return
end

which_key.setup({})
EOF
