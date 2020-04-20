function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color yellow
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color blue
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '$ '
	set_color normal
end

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

set -x LS_COLORS (echo $LS_COLORS | sed "s/ow=34;42/ow=01;34/g") 
