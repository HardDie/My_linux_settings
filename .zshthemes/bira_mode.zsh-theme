# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹ "
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

prompt_git() {
  (( $+commands[git] )) || return
  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\ue0a0'         # 
  }
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      echo -n "%{$fg[yellow]%}"
    else
      echo -n "%{$fg[green]%}"
    fi

    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "${ref/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }%{$reset_color%}"
  fi
}

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
    local user_symbol='$'
fi

local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
source /usr/lib/zsh-git-prompt/zshrc.sh
set_branch_color() {
        GIT_PROMPT_EXECUTABLE="haskell"
    if [ "$GIT_CHANGED" -eq "0" ] && [ "$GIT_CONFLICTS" -eq "0" ] && [ "$GIT_STAGED" -eq "0" ] && [ "$GIT_UNTRACKED" -eq "0" ]; then
        ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%} "
        ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[green]%}"
    else
        ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%} "
        ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[cyan]%}"
    fi
    git_super_status
}
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SEPARATOR=""
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{ ● %G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{ ✖ %G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{ ✚ %G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{ ↓ %G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{ ↑ %G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%}%{ …%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local git_branch='$(set_branch_color)'
local time='%{$fg[white]%}(%*)%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir} ${git_branch} ${time}
╰─%B${user_symbol}%b "
RPS1="%B${return_code}%b"
