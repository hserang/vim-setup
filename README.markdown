Haroun Serang's Vim settings - copied from Edmund Salvacion and personalized
=======================
I need a place to sync and share my vim settings. github is as good a place as any.


Installing on OS X
------------------

    cd ~
    git clone git@github.com:edmundsalvacion/vim-settings.git
    ln -s vim-settings/.vimrc .
    ln -s vim-settings/.vim .
    cd vim-settings
    git submodule init
    git submodule update
