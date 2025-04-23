alias lsa='ls -la'
alias lsl='ls -l'
alias cls='clear'
alias pls='sudo'
alias rmr='rm -r -I'
alias sdu='sudo dnf update'

# SSH agent
alias ssha='eval $(ssh-agent) 1>/dev/null'

# Monitors
alias monitoroff='xrandr --output DisplayPort-1 --off'
alias monitoron='xrandr --output DisplayPort-0 --primary --mode 3440x1440 --rate 144 --pos 0x1440 --rotate normal --output DisplayPort-1 --mode 2560x1440 --rate 74.92 --pos 529x0 --rotate normal'

## Git aliases
alias gitlog='/usr/bin/git log --abbrev-commit'
alias dotconfig='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME' 

#redshift
alias dayshift='redshift -PO 6500 1>/dev/null'
alias nightshift='redshift -PO 3800 1>/dev/null' 

# Make dir then cd to it
mcd()
{
    test -d "$1" || mkdir -p "$1" && cd "$1"
}
