# Configuration

## Initial Setup (Ubuntu)
To start with run:

```shell
sudo apt-get update
sudo apt-get upgrade
sudo apt install build-essential
git clone https://github.com/kennedymj97/configs.git
cd configs
ln -s $(pwd)/nvim/ ~/.config/
ln -s $(pwd)/tmux/ ~/.config/
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
rm ~/.gitconfig
ln -s $(pwd)/gitconfig ~/.gitconfig
```

Install node:

1. Go to the [node website](https://www.nodejs.org/en/) and check the latest stable version.
1. Go to the [nodesource repo](https://github.com/nodesource/distributions#deb) and follow instructions to install the latest version.

Install rust:
Just go to the [install page](https://www.rust-lang.org/tools/install) on the rust site and follow the instructions.

### Neovim (stable release)
*In WSL1 you cannot install appimages so you have to follow the alternative steps.*  
Installing normally:
```shell
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x nvim.appimage
mv ./nvim.appimage /usr/bin
echo 'alias vim="nvim"' >> ~/.bash_aliases
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.local/share/nvim/site/plugged
```

Installing in WSL1:
```shell
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
```
**Install the plugins:**
Open nvim and run :PlugInstall

**Install rust-analyzer for coc:**
```shell
cargo install cargo-watch
```
Open nvim and run :CocInstall coc-rust-analyzer

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

The ls command after changing style may have directories that are very hard to read. To fix this add the following to ~/.bashrc:

```bash
export LS_COLORS=$(echo $LS_COLORS | sed "s/ow=34;42/ow=01;34/g")
```

### Fuzzy finder
Note: requires rust to be installed first (for ripgrep installation)
```shell
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
cargo install ripgrep
```

## Editing config

### Vim and terminal color scheme
Type `base16_` and autocomplete to see all the options then input the desired option

### tmux color scheme
- Select the desired color scheme from the [base16-tmux repository](https://github.com/mattdavis90/base16-tmux/tree/master/colors). 
- Download this file into the tmux folder and update the bottom line of the tmux.conf file.
- Delete the tmux folder from ~/.config/tmux
```shell
rm -r ~/.config/tmux
```
- Restore the symlink, the following is from the root of this repo
```shell
mkdir ~/.config/tmux
ln -s $(pwd)/tmux/* ~/.config/tmux/
```

