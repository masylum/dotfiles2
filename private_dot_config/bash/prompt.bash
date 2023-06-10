parse_git_branch() {
   git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

_RESET="\e[0m"
_YELLOW="\e[33m"
_BLUE="\e[34m"
_GREEN="\e[32m"

PS1="${_GREEN}\w${_BLUE}$(parse_git_branch) ${_YELLOW}\$ ${_RESET}"
