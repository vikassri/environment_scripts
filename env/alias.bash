


f(){
cat ~/env/* | grep -w $1
}

alias csub='cd /Users/vssrivastava/Work/Code/sublime'
alias cvc='cd /Users/vssrivastava/Work/Code/vscode'
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

alias ssh='ssh -o StrictHostKeyChecking=no'
alias findport='netstat -vanp tcp | grep'
alias myip='echo `curl -s https://ifconfig.me/`'                  # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

# alias 
alias ll='ls -la'
alias c='clear'

## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# extra
alias bc='bc -l'
alias sha1='openssl sha1'
alias mkdir='mkdir -pv'
alias diff='colordiff'

# path
alias path='echo -e ${PATH//:/\\n}'

# time related
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'

# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

# ports
alias ports='netstat -tulanp'

# reload bash stuff
alias reload='. ~/.bash_profile'

# copy the public key
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
