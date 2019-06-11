# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
	local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
	local user_symbol='#'
else
	local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
	local user_symbol='$'
fi

local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'

local time='%{$fg[white]%}(%*)%{$reset_color%}'

git_prompt() {
	BRANCH_CHAR=$'\ue0a0' # 
	CHANGED_PREFIX="%{$fg[red]%}%{ ✚ %G%}"
	UNTRACKED_PREFIX="%{$fg[yellow]%}%{ …%G%}"
	STAGED_PREFIX="%{$fg[green]%}%{ ● %G%}"
	CONFLICTS_PREFIX="%{$fg[red]%}%{ ✖ %G%}"

	# Check if repo exist
	if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]]; then
		BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

		echo -n "%{$fg_bold[cyan]%}"
		echo -n $BRANCH_CHAR $BRANCH_NAME
		echo -n "%{$reset_color%}"

		# Check if repo is dirty or staged
		STATUS=$(git status --porcelain)
		if [[ $STATUS != "" ]]; then
			MODIFIED=$(grep -c "^.M" <<< $STATUS)
			STAGED=$(grep -c "^M\|^A\|^D" <<< $STATUS)
			UNTRACKED=$(grep -c "^??" <<< $STATUS)
			CONFLICTS=$(grep -c "^UU" <<< $STATUS)

			if [[ $STAGED -ne 0 ]]; then
				echo -n ${STAGED_PREFIX}${STAGED}
			fi

			if [[ $MODIFIED -ne 0 ]]; then
				echo -n ${CHANGED_PREFIX}${MODIFIED}
			fi

			if [[ $UNTRACKED -ne 0 ]]; then
				echo -n ${UNTRACKED_PREFIX}
			fi

			if [[ $CONFLICTS -ne 0 ]]; then
				echo -n ${CONFLICTS_PREFIX}${CONFLICTS}
			fi
		fi

		echo -n "%{$reset_color%}"
	fi
}

local git_prompt='$(git_prompt)'

PROMPT="╭─${user_host} ${current_dir} ${time} ${git_prompt}
╰─%B${user_symbol}%b "
RPS1="%B${return_code}%b"
