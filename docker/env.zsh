if which boot2docker &>/dev/null; then
  eval "$(boot2docker shellinit --verbose=false &>/dev/null)"
fi