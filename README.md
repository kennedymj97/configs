# Configuration

Before proceeding install homebrew (can be done on either Linux or MacOS now)

1. Alacritty
    1. brew install --cask alacritty
2. vscode
    1. Install vs code from site.
    2. Launch vs code from apps and do cmd+shift+p and execute "Shell Command: install 'code' command in PATH (if macOS)
    3. Install one dark pro (binaryify)
    4. Install material icons (Philipp Kief)
    5. Install Neo Vim extension and add the binary path as /usr/local/bin/nvim (Alexey Svetliakov)
    6. Disable the "workbench.list.automaticKeyboardNavigation" setting
    7. Enable the format on save setting
3. nvim > 0.5 (nightly version at time of writing)
    1. brew install --HEAD luajit
    2. brew install --HEAD neovim
    3. mkdir ~/.local/share/nvim/site/plugged
    4. Install vim plugged: https://github.com/junegunn/vim-plug
4. Terminal utilities (can all be brew installed)
    1. tmux
    2. exa
    3. fzf
    4. ripgrep
    5. fd
5. Install oh-my-zsh & powerlevel10k
    1. Install oh-my-zsh: https://github.com/ohmyzsh/ohmyzsh
    2. Install powerlevel10k: https://github.com/romkatv/powerlevel10k#oh-my-zsh (make sure to install the fonts)
    3. After installing need to run `p10k configure` to setup.
6. Install base16-shell
    1. https://github.com/chriskempson/base16-shell
    2. Restart shell and type base16_gruvbox-dark-hard.
7. Create all the symlinks
    1. ln -s $(pwd)/nvim/ ~/.config/
    2. ln -s $(pwd)/tmux/ ~/.config/
    3. ln -s $(pwd)/alacritty/ ~/.config/
    4. ln -s ~/.config/tmux/tmux.conf ~/.tmux.conf
    5. ln -s $(pwd)/gitconfig ~/.gitconfig
    6. ln -s $(pwd)/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json (path will be different on linux)
    7. ln -s $(pwd)/zshrc ~/.zshrc
8. Create ssh key for GitHub
    1. https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

# Usage
This configuration may be used on multiple machines. Some changes on these machines may need to be local to only that machine. In this case create a new branch `local` and do not push it to GitHub. Any changes that should be done for all machines should be made to master and merged in to the local branch. The local branch is what will be used on the machine on a daily basis.