export FZF_DEFAULT_COMMAND='find . -printf "%P\\n"'
export HSA_OVERRIDE_GFX_VERSION='10.3.0'
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Configuración para hacer el autocompletado case-insensitive
bind "set completion-ignore-case on"

if command ls --color -d . &> /dev/null; then
	alias ls='ls --color=auto'
	# BSD `ls` doesn't need an argument (`-G`) when `$CLICOLOR` is set.
fi

# List directory contents
alias sl=ls
alias la='ls -AF' # Compact view, show hidden
alias ll='ls -al'
alias l='ls -a'
alias l1='ls -1'
alias lf='ls -F'

alias _='sudo'

# Shortcuts to edit startup files
alias vbrc='${VISUAL} ~/.bashrc'
alias vbpf='${VISUAL} ~/.bash_profile'

# colored grep
# Need to check an existing file for a pattern that will be found to ensure
# that the check works when on an OS that supports the color option
alias grep='grep --color=auto'

alias c='clear'
alias cls='clear'

alias edit='${EDITOR}'
alias pager='${PAGER:=less}'

alias q='exit'

alias ..='cd ..'         # Go up one directory
alias cd..='cd ..'       # Common misspelling for going up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back

# Shell History
alias h='history'

# Directory
alias md='mkdir -p'
alias rd='rmdir'

# Shorten extract
alias xt='extract'

# Vim to a fuzzy finded file
alias vf='vim $(fzf)'

# Display whatever file is regular file or folder
function catt() {
	for i in "$@"; do
		if [[ -d "$i" ]]; then
			ls "$i"
		else
			cat "$i"
		fi
	done
}

function mdcd() { mkdir -p "$@" && cd "$@" ; }

eval "$(zoxide init bash)"
