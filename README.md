# Configuration

Use iTerm2 as terminal
Install homebrew before proceeding.

### github

Create ssh key:
https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

### Shell

Install oh-my-zsh: https://github.com/ohmyzsh/ohmyzsh
Install powerlevel10k: https://github.com/romkatv/powerlevel10k#oh-my-zsh

After installing may need to run `p10k configure` to install the font and set up styling.

#### Styling
I like to use [base16-shell](https://github.com/chriskempson/base16-shell) styling to style my terminal along with vim.

Open a new shell and type base16_gruvbox-dark-hard (or another theme). A few lines in init.vim make vim use whatever style is set in the terminal.

Apply base16 iterm2 style (see https://github.com/martinlindhe/base16-iterm2)

### Neovim

```shell
brew install --HEAD luajit
brew install --HEAD neovim
mkdir ~/.local/share/nvim/site/plugged
```

Install vim plugged: https://github.com/junegunn/vim-plug

### VS Code

Install vs code from site.
Launch vs code from apps and do cmd+shift+p and execute "Shell Command: install 'code' command in PATH
Install one dark pro (binaryify)
Install material icons (Philipp Kief)
Install Neo Vim extension and add the binary path as /usr/local/bin/nvim (Alexey Svetliakov)
Disable the "workbench.list.automaticKeyboardNavigation" setting

### tmux

brew install tmux

### exa

brew install exa

### Adding configuration files
If using bash then a $ needs to be added before the ().
```shell
ln -s (pwd)/nvim/ ~/.config/
ln -s (pwd)/tmux/ ~/.config/
ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
ln -s (pwd)/gitconfig ~/.gitconfig
ln -s (pwd)/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s (pwd)/zshrc ~/.zshrc
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

