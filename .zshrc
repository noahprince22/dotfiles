# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

source ~/.profile
source ~/.bashrc

DOTFILE_HOME=$HOME/dotfiles

# Start up tmux
# export ZSH_TMUX_AUTOSTART=true

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export NODE_PATH='/usr/local/bin/node'
export NODE_PATH=/usr/local/lib/jsctags:$NODE_PATH
export TERM=xterm-256color
export SCALA_HOME=/usr/local/share/scala
export PATH=$SCALA_HOME/bin:$PATH
export PATH=/opt/chefdk/bin:$PATH

export MAVEN_OPTS="-Xmx5120m -XX:MaxPermSize=1280m"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
SOLARIZED_THEME=dark
ZSH_THEME="blinks"

# Aliases to easily edit configuration files that are under version control.
# The pattern is e (for edit) then the filename dropping the starting dot
# DOTFILE_HOME default is $HOME/dotfiles.

alias ezshrc="vim $DOTFILE_HOME/.zshrc"
alias evimrc="vim $DOTFILE_HOME/.vimrc"
alias etmux.conf="vim $DOTFILE_HOME/.tmux.conf"
alias eeclimrc="vim $DOTFILE_HOME/.eclimrc"
alias egitignore="vim $DOTFILE_HOME/.gitignore"

alias szshrc="source $DOTFILE_HOME/.zshrc"

alias glc="git ls-files -u"
alias git-lsu="git ls-files -u | cut -f 2 | sort -u"
alias git-tree="git log --oneline --graph --color --all --decorate"

alias ed="emacs --daemon"
alias ec="emacsclient -c"
alias e="emacsclient -t"
alias check-emacs="ps aux | grep emacs"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(git osx brew common-aliases git-extras jira knife mvn scala tmux zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  #export EDITOR='TERM=xterm-16color emacs'
  export EDITOR='vim'
else
  #export EDITOR='TERM=xterm-16color emacs'
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

#export JAVA_TOOL_OPTIONS=-Djava.awt.headless=true

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
# [[ -s "/Users/bv031773/.gvm/bin/gvm-init.sh" ]] && source "/Users/bv031773/.gvm/bin/gvm-init.sh"
