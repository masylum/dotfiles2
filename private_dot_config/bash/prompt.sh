_RESET="\e[0m"
_YELLOW="\e[33m"
_BLUE="\e[34m"
_GREEN="\e[32m"

export PS1="${_GREEN}\w${_BLUE}$(__git_ps1 "(%s)") ${_YELLOW}\$ ${_RESET}"
