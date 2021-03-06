#!/bin/zsh

PROFILE_STARTUP=true
if [[ "$PROFILE_STARTUP" == true ]]; then
  zmodload zsh/zprof # Output load-time statistics
  # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  PS4=$'%D{%M%S%.} %N:%i> '
  exec 3>&2 2>"${XDG_CACHE_HOME:-$HOME/tmp}/zsh_statup.$$"
  setopt xtrace prompt_subst
fi

# Entirety of your .zshrc

if [[ "$PROFILE_STARTUP" == true ]]; then
  zprof
  unsetopt xtrace
  exec 2>&3 3>&-
fi
