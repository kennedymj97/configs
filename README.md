# Configuration

Install homebrew before proceeding.

### github

Create ssh key:
https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

### Fish

```shell
brew install fish
sudo vim /etc/shells
```

Add "/usr/local/bin/fish" on a new line at the end.

```shell
chsh -s /usr/bin/local/fish
```

### Neovim

```shell
brew install --HEAD luajit
brew install --HEAD neovim
```

### VS Code

Install vs code from site.
Launch vs code from apps and do cmd+shift+p and execute "Shell Command: install 'code' command in PATH
Install one dark pro (binaryify)
Install material icons (Philipp Kief)
Install Neo Vim extension and add the binary path as /usr/local/bin/nvim (Alexey Svetliakov)
Disable the "workbench.list.automaticKeyboardNavigation" setting

### tmux

brew install tmux

### Styling
I like to use [base16-shell](https://github.com/chriskempson/base16-shell) styling to style my terminal along with vim.

```shell
git clone git@github.com:chriskempson/base16-shell.git ~/.config/base16-shell
```

Open a new shell and type base16_gruvbox-dark-hard (or another theme). A few lines in init.vim make vim use whatever style is set in the terminal.

### Adding configuration files
If using bash then a $ needs to be added before the ().
```shell
ln -s (pwd)/nvim/ ~/.config/
ln -s (pwd)/tmux/ ~/.config/
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
rm ~/.gitconfig
ln -s (pwd)/gitconfig ~/.gitconfig
rm ~/.config/fish/config.fish
ln -s (pwd)/config.fish ~/.config/fish/config.fish
ln -s (pwd)/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```
On compeltion restart the terminal.

## Editing Configs

### Vim and terminal colour scheme
Type `base16_` and autocomplete to see all the options then input the desired option

### tmux colour scheme
1. Select the desired colour scheme from the [base16-tmux repository](https://github.com/mattdavis90/base16-tmux/tree/master/colors). 
2. Download this file into the tmux folder and update the bottom line of the tmux.conf file.
3. Delete the tmux folder from ~/.config/tmux
```shell
rm -r ~/.config/tmux
```
4. Restore the symlink, the following is from the root of this repo
```shell
mkdir ~/.config/tmux
ln -s (pwd)/tmux/* ~/.config/tmux/
```

