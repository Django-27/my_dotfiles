# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/sunny/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias git st='git status'

alias vi='vim'
alias game24='24gameconsole'

export FLASK_DEBUG=1
export IS_MOCK_LOGIN=1

export WORKON_HOME=/Users/sunny/code/envs
export PROJECT_HOME=/Users/sunny/code
export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.8/bin/python3
source /Library/Frameworks/Python.framework/Versions/3.8/bin/virtualenvwrapper.sh
HIST_STAMPS="yyyy-mm-dd"

plugins=(git autojump)
# 复制下面这句，开始用 j 进行跳转
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

ZSH_THEME="robbyrussell"
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

################################################################
################### rm 回收站 ##################################
### 重定义rm命令 ###
# 定义回收站目录
trash_path='~/.trash'
# 判断 $trash_path 定义的文件是否存在，如果不存在，那么就创建 $trash_path.
if [ ! -d $trash_path ]; then
    mkdir -p $trash_path
fi
# 定义别名：使用 rm 就调用 trash
alias rm=trash
# 使用 rl 就调用 'ls ~/.trash'
# 如果更改上面的回收站目录这里的目录也需要修改
alias rl='ls ~/.trash'
# 使用 unrm 就调用 restorefile，需要在删除目录的父目录下执行
alias unrm=restorefile
# 使用 rmtrash 就调用 claearteash
alias rmtrash=cleartrash
# 恢复文件的函数
restorefile()
{
    mv -i ~/.trash/$@  ./
}
# 删除文件的函数
trash()
{
    mv $@  ~/.trash/
}
# 清空回收站的函数
cleartrash()
{
    read -p "确定要清空回收站吗?[y/n]" confirm
    [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf  ~/.trash/*
}
################### rm 回收站 ##################################
################################################################

alias jbook='jupyter notebook'

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
export HOMEBREW_NO_AUTO_UPDATE=true

export JAVA_HOME=/Library/java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:$JAVA_HOME/bin

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

export HBASE_HOME=/usr/local/Cellar/hbase/1.3.5/libexec/
export PATH=$PATH:${HBASE_HOME}/bin
export PATH="/usr/local/opt/openjdk/bin:$PATH"

export SPARK_HOME=/usr/local/Cellar/apache-spark/2.4.5/
export PATH=$PATH:${SPARK_HOME}/bin

export HADOOP_HOME=/usr/local/Cellar/hadoop/3.2.1_1/libexec
export PATH=$PATH:${HADOOP_HOME}/bin
export HADOOP_ROOT_LOGGER=INFO,console
export HADOOP_COMMON_HOME=$HADOOP_HOME

alias hstart="/usr/local/Cellar/hadoop/3.2.1_1/sbin/start-all.sh"
alias hstop="/usr/local/Cellar/hadoop/3.2.1_1/sbin/stop-all.sh"

export PYSPARK_PYTHON="/Library/Frameworks/Python.framework/Versions/3.7/bin/python3.7"
export PYSPARK_DRIVER_PYTHON="/Library/Frameworks/Python.framework/Versions/3.7/bin/ipython3"
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"
alias pysbook='$SPARK_PATH/bin/pyspark'

export PATH="/usr/local/opt/bzip2/bin:$PATH"

alias h='function hdi(){ howdoi $* -c -n 5; }; hdi'

alias zk='zkServer='
alias hstart="/usr/local/Cellar/hadoop/3.2.1_1/libexec/sbin/start-all.sh"
alias hstop="/usr/local/Cellar/hadoop/3.2.1_1/libexec/sbin/stop-all.sh"

export AIRFLOW_HOME=~/airflow
export SLUGIFY_USES_TEXT_UNIDECODE=yes

export PATH=$PATH:/Users/sunny/mq/maven/bin
export PATH="/usr/local/opt/apr/bin:$PATH"

export PATH=$PATH:/usr/local/go/bin
