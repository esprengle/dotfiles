# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
# case $- in
#     *i*) ;;
#       *) echo "not interactive shell"; return;;
# esac

set -o vi


# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

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
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac


# Enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors \
        && eval "$(dircolors -b ~/.dircolors)" \
        || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


##
# -- ESIO START
##

export LS_COLORS="rs=0:di=1;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

alias l="ls -1F"
alias la="ls -1AF"
alias ll="ls -alF"
alias lsa="ls -AF"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias mkdirp="mkdir -p "



# ---------- GITHUB
export GITHUB_USER="esprengle"
export GITHUB_TOKEN="a09bd30bec0078d30e6332997438853fa48f89df"

eval "$(gh completion -s bash)"


# ---------- asdf
. /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh
. /home/linuxbrew/.linuxbrew/opt/asdf/etc/bash_completion.d/asdf.bash

# ---------- VARIABLES
[ -x "$(which nvim)" ] && export EDITOR=nvim || export EDITOR=vim



# ---------- zoxide
eval "$(zoxide init bash)"


# ---------- direnv
# Hook direnv into your shell.
eval "$(asdf exec direnv hook bash)"

# A shortcut for asdf managed direnv.
direnv() {
  asdf exec direnv "$@";
}


safe_source(){
    local file="${1:-}"
    
    [[ -z $file ]] && return 1

    if [[ -f "$file" ]]; then
        . "$1"
    else
        false
    fi
}

# XXX: Testing safe_source(); uncomment line below for orig functionality
safe_source ~/.asdf/installs/ripgrep/13.0.0/complete/rg.bash
# . ~/.asdf/installs/ripgrep/13.0.0/complete/rg.bash


# ---------- starship
eval "$(starship init bash)"
eval "$(starship completions bash)"

for _file in ~/.local/share/bash-completion/completions/*; do
    source $_file
done
unset _file

for _file in /home/linuxbrew/.linuxbrew/etc/bash_completion.d/*; do
    source $_file
done
unset _file


# --- #



source /home/esio/.config/broot/launcher/bash/br
eval "$(register-python-argcomplete pipx)"



# =========================
# |||--- FASD Aliases---|||
# =========================
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
# FROM:
#   github.com/simensen/dotfiles
for file in ~/.bash/{path,prompt,exports,aliases,functions,extra}; do
    [ -r "${file}" ] && [ -f "${file}" ] && source "${file}";
    export ESIO_LOADED_RC="${ESIO_LOADED_RC:-}:${file}"
done
unset file



# ------- where.bash ------- #
# see Brett Terpstra project 'where'
# export WHERE_HOOK_SOURCE=true
# export WHERE_EXPIRATION=86400   # once a day
# source "$HOME/bin/_where.bash"



# ------- SHELL OPTIONS ------- #
shopt -s nocaseglob;        # Case insensitive globbing (used in pathname expansion)
shopt -s histappend;        # Append to the Bash history file
shopt -s cdspell;           # Autocorrect typos in path names when using `cd`


# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s ${option} 2> /dev/null;
done;
unset option


fn_mkd_add_to_z() {
    zoxide add "$1"
}


fn_mkd_add_to_bashmarks() {
    local name="$1"
    bm $name
}

HAS_RIPGREP=1

mkd() {
    local newdir usage

    usage="usage: ${0#*/} <dirname>"

    if (( $# > 1 )); then
        echo "$usage"
    fi
    newdir=${1:-none}
    echo -e "\n::mkd:: newdir: ${newdir}" >&2

    # [[ $newdir = none ]] && echo "$usage" && return 1
    mkdir -p "$newdir" && cd "$newdir"
    return 0
}


# From: <https://stackoverflow.com/a/51669404>
dos_path_to_linux(){
    sed -e 's?\\?/?g' -e' s?[cC]:?/mnt/c?' <<<"$1"
}


# eval "$(pyenv init -)"
#  --- Pycharm / IDE Support
#
# Found this snippet in direnv GitHub wiki:
#
# https://gist.github.com/markph0204/dd97d9d301483fcc2cf458f5e44ff25d
#
#   > You can use direnv to create your local virtualenv
#   > following normal means: echo "layout python3" > .envrc
#   > 
#   > But certain editors that look for local .env, env or venv will
#   > not find .direnv/python-x.x.x/. You can however create a soft
#   > link. Pycharm will automatically find and use the local environment.
#
#       - File: https://gist.github.com/markph0204/dd97d9d301483fcc2cf458f5e44ff25d

venv_here() {
    echo "layout python3" > .envrc
    echo "ln -s .direnv/\$(basename \$VIRTUAL_ENV)/ .env" >> .envrc
    # Example
    # -------
    # cd to any path, then run...
    #
    #   $ venv-here
    #
    # prompted to run direnv allow
    #   $ direnv allow
    #
    # you could just use 'layout python' here for 2.7.x
}


log_prefix() {
    local _prefix="${1}"
    shift
    printf '[%s] %s' "$_prefix" "${@}"
    unset _prefix
}


getopt_simple() {
  until [ -z ${1} ]; do
    if [ ${1:0:1} = '/' ]; then
      tmp=${1:1}        # Strip off leading '/'...
      param=${tmp%%=*}  # Extract name; %% - strip match at str *start*
      value=${tmp##*=}  # Extract value; ## - strip match at str *end*

      printf 'Parameter: "%s", value: "%s\n"' $param $value
      echo "Parameter: '${param}', value: '${value}'"
      eval ${param}=${value}
    fi
    shift
  done
}


log_file_not_found() {
  local prefix

  if [ ${1:0:2} = "-p" ]; then
    prefix=${2}
  elif [ ${1:0:8} = '--prefix' ]; then

    if [ ${1:8:1} = '=' ]; then
      prefix=${1##*=}
    else
      prefix=${2}
    fi

  else
    prefix=""
  fi

  printf "%s\e[31m<File: \e[3mname=\e[0m'\e[31m\e[1m\e[4m%s\e[0m\e[31m'> not found\e[0m" ${prefix} ${1}
}


poetry_here()
{
    local _fn_name="poetry_here"

    if [ ! -f pyproject.toml ]; then
        log_func $_fn_name "<File: name='pyproject.toml'> not found."
        echo "[poetry_here] <File: name='pyproject.toml'> not found."
        echo "[poetry_here] Running command: '$ poetry init'"
        poetry init
        echo "[poetry_here] <File: name='pyproject.toml'> created. Continuing..."
    else
        echo "[poetry_here] <File: pyproject.toml> found. Continuing..."
    fi

    echo 'layout poetry' >> .envrc && direnv allow .
    direnv allow .

    # Not needed since using asdf and, as configured, creates
    # the virtualenv in '.venv' folder by default
    # echo 'ln -s .direnv/$(basename ${VIRTUAL_ENV})/ .venv' >> .envrc

    # Example
    # -------
    # cd to any path, then run...
    #
    #   $ poetry-here
    #
    # prompted to run direnv allow
    #   $ direnv allow
    #
    # you could just use 'layout python' here for 2.7.x
}


[ -f  ~/.local/bin/bashmarks.sh ] &&  source ~/.local/bin/bashmarks.sh ||  echo '[INFO] Not Installed:  `bashmarks`'

# eval "$(register-python-argcomplete pipx)"



# Usage: has <command>
#
# Returns 0 if the <command> is available. Returns 1 otherwise. It can be a
# binary in the PATH or a shell function.
#
# Example:
#    if has curl; then
#      echo "Yes we do"
#    fi
#
has() {
  type "${1}" &>/dev/null
}


# Usage: err_cmdnotfound <command>
#
# Logs an error message to stderr
err_cmdnotfound() {
  local prefix cmd

  if (($# = 2)); then
    prefix="$1"
    cmd="$2"
  else
    cmd="$1"
  fi

  print '\e[33m::%s::\e[m Command Not Found - \e[1;31m%s\e[m' "${prefix:-${0##*/}}" $cmd >&2
}


# Usage: join_args [args...]
#
# Joins all the passed arguments into a single string that can be evaluated
# by bash.
#
# This is useful when one has to serialize an array of arguments back into
# a string.
join_args() {
  printf '%q ' "$@"
}



# eval "$(thefuck --alias)"
# ---------- br
[[ -f $(brew --prefix)/etc/bash_completion.d/br.bash ]] && source $(brew --prefix)/etc/bash_completion.d/br.bash
[[ -f $(brew --prefix)/etc/bash_completion.d/broot.bash ]] && source $(brew --prefix)/etc/bash_completion.d/broot.bash

# ---------- brew
source $(brew --prefix)/etc/bash_completion.d/brew

# ---------- poetry
eval "$(poetry completions bash)"


eval "$(zoxide init bash)"

echo -e "\e[33m::.bashrc::\e[m Checking / setting \e[32mBREW_PREFIX...\e[m"
: "${BREW_PREFIX:=$(brew --prefix)}"
echo -e "\e[33m::.bashrc::\e[m BREW_PREFIX = \e[34m${BREW_PREFIX:-null}\e[m"

if has zoxide; then
    true
else
    echo -e "\e[33m::.bashrc::\e[m Command Not Found - \e[1;31mzoxide\e[m"
    eval "$(fasd --init auto)"

    if type a &>/dev/null \
        && type s &>/dev/null \
        && type d &>/dev/null \
        && type f &>/dev/null;
    then
        alias a='fasd -a'        # any
        alias s='fasd -si'       # show / search / select
        alias d='fasd -d'        # directory
        alias f='fasd -f'        # file
        alias sel_d='fasd -sid'     # interactive directory selection
        alias sel_f='fasd -sif'     # interactive file selection
        alias fz='fasd_cd -d'     # cd, same functionality as j in autojump
        alias fzz='fasd_cd -d -i' # cd with interactive selection
        alias fcd="fasd -e cd -i" # Interactive fasd
    fi

fi

[ -r "$(asdf where ripgrep)"/complete/rg.bash ] && . "$(asdf where ripgrep)"/complete/rg.bash
[ -r "$(brew --prefix)"/etc/bash_completion.d/fd.bash ] && . "$(brew --prefix)"/etc/bash_completion.d/fd.bash



eval "$(tldr --print-completion bash)"

. ~/.local/share/bash-completion/completions/rustup
. ~/.local/share/bash-completion/completions/cargo

source /home/esio/.bash_completions/typer.sh

# ---------- cargo
. "$HOME/.cargo/env"

eval "$(pip completion --bash)"

# ---------- 1password-cli
eval "$(op completion bash)" || log_prefix '1password-cli' 'Attempt to source
compoletion failed' >&2

