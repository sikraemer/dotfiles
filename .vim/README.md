# vim
Use vim as an IDE (mainly for C++).

These settings were tested with vim 8.1 and gdb 8.1 on Ubuntu 16.04 and Ubuntu 18.04.
vim must have been compiled with `+python3` and `+terminal`.

## Dependencies

#### YouCompleteMe
The plugin [`YouCompleteMe`](https://github.com/Valloric/YouCompleteMe) requires the following packages to be installed.

```bash
sudo apt install build-essential cmake python3-dev vim-gui-common vim-runtime
```

### Configure vim-airline
The plugin [`vim-airline`](https://github.com/vim-airline/vim-airline) makes use of powerline fonts.

```bash
sudo apt-get install fonts-powerline
```

## Initialization
Activate the configuration by linking the .vimrc file into yout home directory

```bash
cd ~
ln -s .vim/.vimrc .vimrc
```

Open up vim and let Vundle install all plugins by running the following vim command

```vim
:PluginInstall
```

### Install YouCompleteMe
To have [`YouCompleteMe`](https://github.com/Valloric/YouCompleteMe) ready for C++ usage, please run the following commands in a shell

```bash
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clang-completer --clangd-completer
```

For additional languages and overall usage information please refer to the YouCompleteMe documentation

You may also want to create a global `.ycm_extra_conf.py` file to provide hints for the YCM code completion.
See [`.ycm_extra_conf.py.example`](.ycm_extra_conf.py.example) for an example configuration.


## Usage
There is nothing here yet. As for the moment, please read the commented [`.vimrc`](.vimrc) carefully.


