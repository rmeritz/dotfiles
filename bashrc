# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Ignore any empty directories below.
shopt -s nullglob

# Load all POSIX settings.
if [ -d $HOME/.sh.d ]; then
  for config in $HOME/.sh.d/*; do
    . $config
  done
fi

# Load all bash-specific settings. First load pre-settings from
# ~/.bash.d/pre, then normal settings from ~/.bash.d, then post-settings
# from ~/.bash.d/post .
if [ -d $HOME/.bash.d ]; then
  for config in $HOME/.bash.d/pre/*; do
    . $config
  done

  for config in $HOME/.bash.d/*; do
    if [ -f $config ]; then
      source $config
    fi
  done

  for config in $HOME/.bash.d/post/*; do
    source $config
  done
fi

# Don't ignore non-matching globs interactively; turn off nullglob.
shopt -s failglob
