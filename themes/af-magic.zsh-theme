#
# A theme based on steeef theme
#  * RVM/Rbenv info shown on the right
#  * Git branch info on the left
#  * Single line prompt
#
# Authors:
#   Steve Losh <steve@stevelosh.com>
#   Bart Trojanowski <bart@jukie.net>
#   Brian Carper <brian@carper.ca>
#   steeef <steeef@gmail.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Yan Pritzker <yan@pritzker.ws>

function prompt_skwp_precmd {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS

  # Get Git repository information.
  if (( $+functions[git-info] )); then
    git-info on
    git-info
  fi

  # Get ruby information
  if (( $+functions[ruby-info] )); then
    ruby-info
  fi
}

function prompt_skwp_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  autoload -Uz add-zsh-hook

  add-zsh-hook precmd prompt_skwp_precmd

  # Use extended color pallete if available.
  if [[ $TERM = *256color* || $TERM = *rxvt* ]]; then
    __PROMPT_SKWP_COLORS=(
      "%F{81}"  # turquoise
      "%F{166}" # orange
      "%F{135}" # purple
      "%F{161}" # hotpink
      "%F{118}" # limegreen
    )
  else
    __PROMPT_SKWP_COLORS=(
      "%F{cyan}"
      "%F{yellow}"
      "%F{magenta}"
      "%F{red}"
      "%F{green}"
    )
  fi

  # git (1=blue, 2=yellow, 3=magenta, 4=red, 5=green)
  zstyle ':prezto:module:git:info:branch' format "${__PROMPT_SKWP_COLORS[1]}%b %f"

  zstyle ':prezto:module:git:info:added' format "${__PROMPT_SKWP_COLORS[5]}S%f"
  zstyle ':prezto:module:git:info:deleted' format "${__PROMPT_SKWP_COLORS[4]}D%f"
  zstyle ':prezto:module:git:info:modified' format "${__PROMPT_SKWP_COLORS[3]}M%f"
  zstyle ':prezto:module:git:info:untracked' format "${__PROMPT_SKWP_COLORS[2]}U%f"
  zstyle ':prezto:module:git:info:keys' format 'prompt' '(%b%d%a%m%u)'

  # # Include ruby info (rvm, rbenv) in prompt
  # zstyle ':prezto:module:ruby:info:version' format '[%v]'

  local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

  PROMPT="${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}% %{$reset_color%}"'$git_info[prompt]'" "
#   RPROMPT='%F{blue}${ruby_info[version]}'

}

prompt_skwp_setup "$@"