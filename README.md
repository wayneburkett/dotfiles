My dotfiles
=====
That's it.

Setting up a new laptop:

1. `brew install hub`
1. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
1. `git clone https://github.com/wayneburkett/dotfiles.git`
1. `mkdir -p ~/.vim/bak && ln -sf dotfiles/.vimrc ~/.vimrc && ln -sf dotfiles/.zshrc ~/.zshrc` 
