#!/bin/sh

ESIO_LOG_FORMAT="${ESIO_LOG_FORMAT-esio: %s}"


# Usage: log_status [<message> ...]
#
# Logs a status message. Acts like echo,
# but wraps output in the standard direnv log format
# (controlled by $DIRENV_LOG_FORMAT), and directs it
# to stderr rather than stdout.
#
# Example:
#
#    log_status "Loading ..."
#
log_status() {
  if [[ -n $ESIO_LOG_FORMAT ]]; then
    local msg=$*
    # shellcheck disable=SC2059,SC1117
    printf "${ESIO_LOG_FORMAT}\n" "$msg" >&2
  fi
}


# Usage: log_error [<message> ...]
#
# Logs an error message. Acts like echo,
# but wraps output in the standard direnv log format
# (controlled by $DIRENV_LOG_FORMAT), and directs it
# to stderr rather than stdout.
#
# Example:
#
#    log_error "Unable to find specified directory!"

log_error() {
  local color_normal="\e[m"
  local color_error="\e[31;1m"
  if [[ -n $ESIO_LOG_FORMAT ]]; then
    local msg=$*
    # shellcheck disable=SC2059,SC1117
    printf "${color_error}${ESIO_LOG_FORMAT}${color_normal}\n" "$msg" >&2
  fi
}



# Usage: has <command>
#
# Returns 0 if the <command> is available. Returns 1 otherwise. It can be a
# binary in the PATH or a shell function.
#
# Example:
#
#    if has curl; then
#      echo "Yes we do"
#    fi
#
has() {
  type "$1" &>/dev/null
}


# Usage: join_args [args...]
#
# Joins all the passed arguments into a single string that can be evaluated by bash
#
# This is useful when one has to serialize an array of arguments back into a string
join_args() {
  printf '%q ' "$@"
}
     

# Usage: user_rel_path <abs_path>
#
# Transforms an absolute path <abs_path> into a user-relative path if
# possible.
#
# Example:
#
#    echo $HOME
#    # output: /home/user
#    user_rel_path /home/user/my/project
#    # output: ~/my/project
#    user_rel_path /usr/local/lib
#    # output: /usr/local/lib
#
user_rel_path() {
  local abs_path=${1#-}

  if [[ -z $abs_path ]]; then return; fi

  if [[ -n $HOME ]]; then
    local rel_path=${abs_path#$HOME}
    if [[ $rel_path != "$abs_path" ]]; then
      abs_path=~$rel_path
    fi
  fi

  echo "$abs_path"
}


# Usage: find_up <filename>
#
# Outputs the path of <filename> when searched from the current directory up to
# /. Returns 1 if the file has not been found.
#
# Example:
#
#    cd /usr/local/my
#    mkdir -p project/foo
#    touch bar
#    cd project/foo
#    find_up bar
#    # output: /usr/local/my/bar
#
find_up() {
  (
    while true; do
      if [[ -f $1 ]]; then
        echo "$PWD/$1"
        return 0
      fi
      if [[ $PWD == / ]] || [[ $PWD == // ]]; then
        return 1
      fi
      cd ..
    done
  )
}



# Usage: PATH_add <path> [<path> ...]
#
# Prepends the expanded <path> to the PATH environment variable, in order.
# It prevents a common mistake where PATH is replaced by only the new <path>,
# or where a trailing colon is left in PATH, resulting in the current directory
# being considered in the PATH.  Supports adding multiple directories at once.
#
# Example:
#
#    pwd
#    # output: /my/project
#    PATH_add bin
#    echo $PATH
#    # output: /my/project/bin:/usr/bin:/bin
#    PATH_add bam boum
#    echo $PATH
#    # output: /my/project/bam:/my/project/boum:/my/project/bin:/usr/bin:/bin
#
PATH_add() {
  path_add PATH "$@"
}

# Usage: path_add <varname> <path> [<path> ...]
#
# Works like PATH_add except that it's for an arbitrary <varname>.
path_add() {
  local path i var_name="$1"
  # split existing paths into an array
  declare -a path_array
  IFS=: read -ra path_array <<<"${!1-}"
  shift

  # prepend the passed paths in the right order
  for ((i = $#; i > 0; i--)); do
    path_array=("$(expand_path "${!i}")" ${path_array[@]+"${path_array[@]}"})
  done

  # join back all the paths
  path=$(
    IFS=:
    echo "${path_array[*]}"
  )

  # and finally export back the result to the original variable
  export "$var_name=$path"
}

# Usage: MANPATH_add <path>
#
# Prepends a path to the MANPATH environment variable while making sure that
# `man` can still lookup the system manual pages.
#
# If MANPATH is not empty, man will only look in MANPATH.
# So if we set MANPATH=$path, man will only look in $path.
# Instead, prepend to `man -w` (which outputs man's default paths).
#
MANPATH_add() {
  local old_paths="${MANPATH:-$(man -w)}"
  local dir
  dir=$(expand_path "$1")
  export "MANPATH=$dir:$old_paths"
}

# Usage: PATH_rm <pattern> [<pattern> ...]
# Removes directories that match any of the given shell patterns from
# the PATH environment variable. Order of the remaining directories is
# preserved in the resulting PATH.
#
# Bash pattern syntax:
#   https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html
#
# Example:
#
#   echo $PATH
#   # output: /dontremove/me:/remove/me:/usr/local/bin/:...
#   PATH_rm '/remove/*'
#   echo $PATH
#   # output: /dontremove/me:/usr/local/bin/:...
#
PATH_rm() {
  path_rm PATH "$@"
}

# Usage: path_rm <varname> <pattern> [<pattern> ...]
#
# Works like PATH_rm except that it's for an arbitrary <varname>.
path_rm() {
  local path i discard var_name="$1"
  # split existing paths into an array
  declare -a path_array
  IFS=: read -ra path_array <<<"${!1}"
  shift

  patterns=("$@")
  results=()

  # iterate over path entries, discard entries that match any of the patterns
  # shellcheck disable=SC2068
  for path in ${path_array[@]+"${path_array[@]}"}; do
    discard=false
    # shellcheck disable=SC2068
    for pattern in ${patterns[@]+"${patterns[@]}"}; do
      if [[ "$path" == +($pattern) ]]; then
        discard=true
        break
      fi
    done
    if ! $discard; then
      results+=("$path")
    fi
  done

  # join the result paths
  result=$(
    IFS=:
    echo "${results[*]}"
  )

  # and finally export back the result to the original variable
  export "$var_name=$result"
}