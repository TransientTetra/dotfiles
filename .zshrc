## autoload vcs and colors
autoload -U colors && colors

# Version with glyphs and vcs_info
# autoload -Uz vcs_info
# 
# # enable only git 
# zstyle ':vcs_info:*' enable git 
# 
# # setup a hook that runs before every ptompt. 
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# 
# zstyle ':vcs_info:*' check-for-changes true
# zstyle ':vcs_info:*' stagedstr '%{$fg[cyan]%}'
# zstyle ':vcs_info:*' unstagedstr '%{$fg[red]%}'
# zstyle ':vcs_info:*' formats '%{$fg[cyan]%}%b%u%c'
# PROMPT='%{$fg[cyan]%} %B%{$fg[white]%}%n%{$fg[green]%} at %{$fg[white]%}%m %{$fg[green]%}in %{$fg[cyan]%}%c'
# PROMPT+='%{$fg[green]%} on \$vcs_info_msg_0_%{$reset_color%} %# '

git_branch_test_color() {
  local ref=$(git symbolic-ref --short HEAD 2> /dev/null)
  if [ -n "${ref}" ]; then
    if [ -n "$(git status --porcelain)" ]; then
      local gitstatuscolor='%F{red}'
    else
      local gitstatuscolor='%F{cyan}'
    fi
    echo "%{$fg[green]%} on ${gitstatuscolor}${ref}"
  else
    echo ""
  fi
}
setopt PROMPT_SUBST
PROMPT='%B%{$fg[white]%}%n%{$fg[green]%} at %{$fg[white]%}%m %{$fg[green]%}in %{$fg[cyan]%}%c$(git_branch_test_color)%{$reset_color%} %# '
# add 24h time the right side
# RPROMPT='%D{%k:%M:%S}'
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

source $HOME/.aliases

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
