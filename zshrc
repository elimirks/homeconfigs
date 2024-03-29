# COLURZ!!!

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Set up the prompt

autoload -Uz promptinit
promptinit

setopt histignorealldups sharehistory

# What does this do?
local -A pc

# Just some variable to keep the PROMPT evironment var clean
pc['user']=${1:-'red'}
pc['host']=${1:-'green'}
pc['time']=${2:-'white'}
pc['pwd']=${3:-'blue'}
pc['prom']=${4:-'magenta'}
pc['com']=${4:-'white'}

# %F{$pc['colour']} to allow for color configuration
PROMPT="%F{$pc['user']}%n %F{$pc['host']}%m%F{$pc['time']} %T%f %F{$pc['pwd']}%~ $prompt_newline%F{$pc['prom']}%# %F{$pc['com']}"

# Nice colors
alias grep='grep --color=always'
alias ls='ls --color=always'

# grc colors.. this is a very neat program
alias ping='grc ping'
alias traceroute='grc traceroute'
alias gcc='grc gcc'
alias make='grc make'
alias netstat='grc netstat'
alias diff='grc diff'
alias last='grc last'
alias ldap='grc ldap'
alias cvs='grc cvs'
alias configure='grc ./configure'

# Crazy, short, and cool core util additions

function cl { cd $@ && ls }
function mkc { mkdir $@ && cd $1 }
alias ll='ls -l'
alias la='ls -la'

# emacs style keybindings.. this helps the up arrow issues
bindkey -e

# Use %_ to show why you are in a continued prompt
PROMPT2="%F{$pc['pwd']}%_> %F{$pc['com']}"

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:editor' keymap 'vi'

# Nice auto correct prompt
setopt correct
autoload -U colors && colors
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Fancy prompt stuff

function separator() {

	local TERMWIDTH
	(( TERMWIDTH = ${COLUMNS} ))

	let TERMWIDTH=TERMWIDTH-$1

	while [[ $TERMWIDTH > 0 ]]; do
	
		echo -n "$txtylw-"

		let TERMWIDTH--

	done

}

# preexec is called just before any command line is executed
function preexec() {
	
	separator 0

	echo "$txtrst\n"

	starttime=`date +%H:%M:%S`

}

# precmd is called just before the prompt is printed
function precmd() {

	echo

	separator 26

	echo -n " $txtred$starttime$txtcyn - $txtgrn"`date +%H:%M:%S`"$txtylw -----"

	echo "$txtrst"

}

# Enable the home/end/delete keys
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[3~" delete-char

# Environment
export EDITOR='vim'

