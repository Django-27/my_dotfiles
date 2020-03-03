# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export WORKON_HOME=/root/py_env
VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3.8'
source /usr/local/bin/virtualenvwrapper.sh
