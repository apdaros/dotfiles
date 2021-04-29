## Steps

1. Install `zsh` and `oh-my-zsh`

```
$ sudo apt-get update
$ sudo apt install zsh -y
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

2. Install `typewritten` theme

```
$ git clone https://github.com/reobin/typewritten.git $ZSH_CUSTOM/themes/typewritten
```

3. Install `neovim` and `vimplug`

```
$ sudo apt-get install neovim -y
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

4. Link files

```
$ ./install
$ source ~/.zshrc
```
