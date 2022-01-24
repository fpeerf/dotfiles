# If you come from bash you might have to change your $PATH.
# export PATH=/Users/macbookair/nvim-osx64/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH="/Users/macbookair/.oh-my-zsh"
export GPG_TTY=$(tty)

# Plugins {{{
# ==============================================================================

    # Load the Antibody plugin manager for zsh.
    source <(antibody init)

    # Setup required env var for oh-my-zsh plugins
    # export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh"
    export ZSH=$(antibody path ohmyzsh/ohmyzsh)

    antibody bundle ohmyzsh/ohmyzsh
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/adb
    antibody bundle ohmyzsh/ohmyzsh path:plugins/alias-finder
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/bower
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/composer
    antibody bundle ohmyzsh/ohmyzsh path:plugins/colored-man-pages
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/cp
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/dnf
    antibody bundle ohmyzsh/ohmyzsh path:plugins/docker
    antibody bundle ohmyzsh/ohmyzsh path:plugins/docker-compose
    antibody bundle ohmyzsh/ohmyzsh path:plugins/git
    antibody bundle ohmyzsh/ohmyzsh path:plugins/git-flow
    antibody bundle ohmyzsh/ohmyzsh path:plugins/gpg-agent
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/gulp
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/httpie
    antibody bundle ohmyzsh/ohmyzsh path:plugins/jsontools
    antibody bundle ohmyzsh/ohmyzsh path:plugins/jump
    antibody bundle ohmyzsh/ohmyzsh path:plugins/kubectl
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/nmap
    antibody bundle ohmyzsh/ohmyzsh path:plugins/npm
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/pass
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/rsync
    # antibody bundle ohmyzsh/ohmyzsh path:plugins/ssh-agent
    antibody bundle ohmyzsh/ohmyzsh path:plugins/tmux
    antibody bundle ohmyzsh/ohmyzsh path:plugins/tmuxinator
    antibody bundle ohmyzsh/ohmyzsh path:plugins/vi-mode
    antibody bundle ohmyzsh/ohmyzsh path:plugins/z

    # Other bundles
    # antibody bundle sampson-chen/sack
    #antibody bundle jessarcher/zsh-artisan
    # antibody bundle /home/jess/.oh-my-zsh/custom/plugins/artisan
    antibody bundle zsh-users/zsh-autosuggestions

    # This needs to be the last bundle.
    antibody bundle zsh-users/zsh-syntax-highlighting

    # Load the theme.
    # antibody bundle ohmyzsh/ohmyzsh path:themes/robbyrussell.zsh-theme
    antibody bundle dracula/zsh

# }}
# source $ZSH/oh-my-zsh.sh

# Configuration {{{
# ==============================================================================

    HYPHEN_INSENSITIVE="true"
    ENABLE_CORRECTION="false"
    COMPLETION_WAITING_DOTS="true"
    HIST_STAMPS="yyyy-mm-dd"
    SAVEHIST=1048576
    HISTSIZE=1048576
    HISTFILE="$HOME/.zsh_history"
    ZSH_ALIAS_FINDER_AUTOMATIC=true

    setopt EXTENDED_HISTORY
    setopt NO_CASE_GLOB
    setopt GLOB_COMPLETE
    # expire duplicates first
    setopt HIST_EXPIRE_DUPS_FIRST
    # do not store duplications
    setopt HIST_IGNORE_DUPS
    #ignore duplicates when searching
    setopt HIST_FIND_NO_DUPS
    # removes blank lines from history
    setopt HIST_REDUCE_BLANKS
    # adds commands as they are typed, not at shell exit
    setopt INC_APPEND_HISTORY
    # share history across multiple zsh sessions
    setopt SHARE_HISTORY
    # append to history
    setopt APPEND_HISTORY

    typeset -U path cdpath fpath

    # Vim mode
    # bindkey -v
    export KEYTIMEOUT=1

    # export ANDROID_HOME="$HOME/Android/Sdk/"

    export GIT_EDITOR=vim

    path=(
        $HOME/nvim-osx64/bin
        $HOME/node_modules/.bin
        /opt/local/libexec/gnubin
        /opt/local/bin
        /opt/local/sbin
        /usr/local/bin
        /usr/local/Cellar/lua-language-server/2.6.0/bin
        /Volumes/FontForge/FontForge.app/Contents/Resources/opt/local/bin
        /usr/local/sbin
        $HOME/.local/bin
        $HOME/.bin
        $HOME/bin
        $path
        # $HOME/.composer/vendor/bin
        # $HOME/.go/bin
        # ./vendor/bin
        # ${ANDROID_HOME}tools/
        # ${ANDROID_HOME}platform-tools/
        # $path
    )

    setopt auto_cd
    cdpath=(
        $HOME/Documents/Projects
    )

    zstyle ':completion:*' group-name ''
    zstyle ':completion:*:descriptions' format %d
    zstyle ':completion:*:descriptions' format %B%d%b
    zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
            'local-directories named-directories'

    export EDITOR='vim'
    export NVIM_LISTEN_ADDRESS='/tmp/nvimsocket'
    # export ARTISAN_OPEN_ON_MAKE_EDITOR='nvr'
    export FZF_DEFAULT_COMMAND='ag -u -g ""'

    # unsetopt sharehistory

# }}

# Aliases & Functions {{{
# ==============================================================================

    # Laravel
    # alias a="artisan"
    # alias tinker="artisan tinker"
    # alias serve="artisan serve"
    # alias mfs="artisan migrate:fresh --seed"
    # homestead() {
    #     ( cd ~/Homestead && vagrant $* )
    # }

    # Git
    alias g="git"
    alias gs="git s"
    alias nah="git reset --hard;git clean -df"
    alias co="git checkout"

    # Docker
    alias d="docker"
    alias dc="docker-compose"
    alias dce="docker-compose exec"
    alias dcea="docker-compose exec app"
    dceas () {
        docker-compose exec app su app -c "$*"
    }
    # alias dceasa="dceas php artisan"

    # General
    alias vim="nvim"
    alias sed="gsed"
    # alias mux="tmuxinator"
    # alias copy="xclip -selection clipboard"
    # alias paste="xclip -o -selection clipboard"
    # alias ag="sag"
    # alias cat="bat"
    # alias webcam="gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video1"

    # Open vim with z argument
    v() {
      if [ -n "$1" ]; then
        z $1
      fi

      nvim
    }

    # cd() {
    #     cd $1 && eval ls
    # }
    # alias cd="cdls"
    # open () {
    #     open $* > /dev/null 2>&1
    # }

    # if (( $+commands[tag] )); then
    #     tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
    #     alias ag=tag
    # fi

# }}

# Interactive shell startup scripts {{{
# ==============================================================================

    # if [[ $- == *i* && $0 == '/bin/zsh' ]]; then
    #     ~/.dotfiles/scripts/login.sh
    # fi

# }}}

# vim: set nospell foldmethod=marker foldlevel=0:

[ -f ~/.dircolors ] && source ~/.dircolors

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="dracula"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

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
# alias awk3="/usr/local/Cellar/awk/20180827/bin/awk"
# export MODE_INDICATOR="%F{yellow}+%f"
# export VI_MODE_SET_CURSOR=true
# VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
# . /usr/local/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh
export TERM=alacritty
export LC_ALL=en_US.UTF-8
