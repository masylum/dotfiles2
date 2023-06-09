function __git_dirty {
  git diff --quiet HEAD &>/dev/null
  [ $? == 1 ] && echo "!"
}

grb_git_prompt() {
  local g="$(__gitdir)"
  if [ -n "$g" ]; then
    local IS_DIRTY="$(__git_dirty)"
    # The __git_ps1 function inserts the current git branch where %s is
    local GIT_PROMPT=`__git_ps1 "(%s${IS_DIRTY})"`
    echo ${GIT_PROMPT}
  fi
}

_RESET=$(tput sgr0)
_BOLD=$(tput bold)
_BLUE=$(tput setaf 4)
_GREEN=$(tput setaf 2)

PS1="${_GREEN}\w ${_BLUE}$(grb_git_prompt) ${_BOLD}\$ ${_RESET}"
