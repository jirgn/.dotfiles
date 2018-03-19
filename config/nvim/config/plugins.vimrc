" vim:fdm=marker

" source every plugin configs
for file in split(glob("$DOTFILES/config/nvim/config/plugins/*.vimrc"), '\n')
    exe 'source' file
endfor
