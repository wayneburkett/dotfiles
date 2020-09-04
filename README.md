My dotfiles
=====
That's it.

Setting up a new laptop:

1. `bash <(curl -s https://raw.githubusercontent.com/18F/laptop/master/laptop)`
1. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
1. `git clone https://github.com/wayneburkett/dotfiles.git`
1. `mkdir -p ~/.vim/bak && ln -sf dotfiles/.vimrc ~/.vimrc && ln -sf dotfiles/.zshrc ~/.zshrc` 
