if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    clear
end

function fishfetch
    clear
    neofetch
end

set PATH "$HOME/.local/bin:$PATH" 

alias cat='bat --style header --style snip --style changes --style header'
alias sudo='doas'
alias please='doas'
alias s='startx'
alias shutup='shutdown -h now'
alias e='exit'
alias r='reboot'
alias rm="gtrash put"
alias i3='cd ~/.config/i3 && vim config'


fish_add_path /home/ksenia/.spicetify
