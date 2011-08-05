# Set some aliases that spice up programs
alias vi='vim'
alias ls='ls --color=auto -F'
alias grep='grep --color=auto'

# Add some vim characteristics
alias :q="exit"

#Console colour
PS1='\[\033[01;34m\]\u \[\033[0;36m\]\t\[\033[01;34m\] \w\n\[\033[0;37m\]$ ' 

# Bash completion O.O
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Generate a random number
rand=`date +%N`
let rand=$rand%6

# Choose a random animal
case $rand in

	0) animal="dragon";;
	1) animal="default";;
	2) animal="sheep";;
	3) animal="turkey";;
	4) animal="tux";;
	5) animal="kitty";;

esac

cowsay -f $animal `fortune`

# Some add ons
export XDG_CONFIG_HOME="$HOME/.config"

# Kinect Libs
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH/usr/local/lib64/pkgconfig"

