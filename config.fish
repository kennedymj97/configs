function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color bryellow
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color brblue
		echo -n (basename $PWD)
	end
	set_color brgreen
	printf '%s ' (__fish_git_prompt)
	set_color brred
	echo -n '$ '
	set_color normal
end

set fish_greeting ''

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Launch nvim with vim also
alias vim="nvim"

# Start tmux on launch
if status is-interactive
and not set -q TMUX
    exec tmux
end

function ssh_init
    echo "Initializing new SSH agent..."
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519
end
