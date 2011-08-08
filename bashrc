# Colors!
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

# Set some aliases that spice up programs
alias vi='vim'
alias ls='ls --color=auto -F'
alias grep='grep --color=auto'

# Add some vim characteristics
alias :q="exit"

#Console display
PS1="${bldgrn}\u ${txtgrn}\h ${txtblu}\t ${bldblu}\w \n${txtrst}$ "

# Bash completion O.O
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Generate a random number
rand=`date +%N`
let rand=$rand%6 &>/dev/null

# Choose a random animal
case $rand in

	0) animal="dragon";;
	1) animal="default";;
	2) animal="sheep";;
	3) animal="turkey";;
	4) animal="tux";;
	5) animal="kitty";;
	*) animal="default";;

esac

cowsay -f $animal `fortune`

# Some add ons
export XDG_CONFIG_HOME="$HOME/.config"

# Kinect Libs
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH, /usr/local/lib64/pkgconfig"

