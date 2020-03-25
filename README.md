# Configuration

## Initial Setup (Ubuntu)
To start with run:

```shell
sudo apt-get update
sudo apt-get upgrade
sudo apt install build-essential
git clone https://github.com/kennedymj97/configs.git
cd configs
ln -s $(pwd)/* ~/.config/
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
```

Install node:

1. Go to the [node website](nodejs.org/en/) and check the latest stable version.
1. Go to the [nodesource repo](https://github.com/nodesource/distributions#deb) and follow instructions to install the latest version.

Install rust:
Just go to the [install page](www.rust-lang.org/install) on the rust site and follow the instructions.

### Neovim (stable release)
Note: when moving to wsl2 will likely just be able to install the appimage directly, see the neovim repo for instructions.
```shell
cd ~
mkdir -p appimages
cd appimages
cd ~
mkdir -p appimages
cd appimages
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
mv squashfs-root nvim
cd ~
mkdir -p bin
cd bin
ln -s ../appimages/nvim/AppRun nvim
cd ~
echo 'alias vim="nvim"' >> ~/.bash_aliases
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.local/share/nvim/site/plugged
cd ~/.config/
git clone https://github.com/kennedymj97/nvim.git
```
Open nvim and run :PlugInstall

### Terminal (and vim) base16 styling
```shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

Add following lines to ~/.bashrc
```bash
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
            eval "$("$BASE16_SHELL/profile_helper.sh")"
```

Open a new shell and type base16_gruvbox-dark-hard (or another theme)

### Fuzzy finder
Note: requires rust to be installed first (for ripgrep installation)
```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
cargo install ripgrep
```
