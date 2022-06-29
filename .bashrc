#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;37m\]\342\234\227\[\033[0;31m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
else
    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;37m\]\342\234\227\[\033[0;31m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
fi
unset color_prompt force_color_prompt

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
#alias ls='ls --color=auto'
alias casque='pactl load-module module-switch-on-connect'
alias ins='sudo pacman -S'
alias remove='sudo pacman -Rncs'
alias ngtcp='kill -9 `pidof ngrok` ; rm -rf ~/ngrok.log ; ngrok tcp 51029 --log=stdout >> ~/ngrok.log &'
alias nghttp='kill -9 `pidof ngrok` ; rm -rf ~/ngrok.log ; ngrok http 8080 --log=stdout >> ~/ngrok.log &'
alias ngpub='cat ~/ngrok.log | grep "url="'
alias ngkill='kill -9 `pidof ngrok`; rm -rf ~/ngrok.log'
alias c='clear'
alias ins='sudo pacman -S '
alias upd='sudo pacman -Syu'
alias octopi='/usr/bin/octopi'
alias p='ping google.com'
alias wifipass='nmcli device wifi show-password'
alias routergateway='ip route show'
alias gitlink='git config --get remote.origin.url'
alias inside='ssh ubuntu@51.178.136.49'
alias space='ncdu --exclude /proc --exclude /run --exclude /tmp --exclude /usr --exclude /var'

fcd(){
	cd "$(find -type d | fzf)"
}

op(){
        xdg-open "$(find -type f | fzf)"
}

#PS1='[\u@\h \W]\$ '
export PATH="/home/taktak/.local/bin:$PATH"
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

# BEGIN SNIPPET: OVHcloud Web PaaS CLI configuration
HOME=${HOME:-'/home/taktak'}
export PATH="$HOME/"'.webpaas-cli/bin':"$PATH"
if [ -f "$HOME/"'.webpaas-cli/shell-config.rc' ]; then . "$HOME/"'.webpaas-cli/shell-config.rc'; fi # END SNIPPET
source /usr/share/nvm/init-nvm.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
