ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/vim-pathogen/autoload .
ln -s `pwd`/taglist.vim/plugin .
ln -s `pwd`/taglist.vim/doc .

git submodule init
git submodule update

