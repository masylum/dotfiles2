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

_RESET="\e[0m"
_YELLOW="\e[33m"
_BLUE="\e[34m"
_GREEN="\e[32m"

PS1="${_GREEN}\w${_BLUE}$(grb_git_prompt) ${_YELLOW}\$ ${_RESET}"
