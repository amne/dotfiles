# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

export WSL_IP=$(ip -j addr show | jq '.[] | select(.ifname=="eth0") | .addr_info[] | select(.family=="inet") | .local' -r)
export DOCKER_HOST=tcp://127.0.0.1:2375
export XDEBUG_IP=`ip -4 -j addr show eth0 | jq '.[].addr_info | .[].local' -r`
alias bumphelm="pybump bump --file Chart.yaml --level minor"

PATH="$HOME/work/lab/istio/bin:$PATH"

alias wnbdots='/usr/bin/git --git-dir=/home/amne/.wnbdots/ --work-tree=/home/amne'
