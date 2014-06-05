# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Load all POSIX settings.
if [ -d $HOME/.sh.d ]; then
    configs=`find $HOME/.sh.d -xtype f`
    for config in $configs; do
        . $config
    done
fi

# Load all bash-specific settings. First load pre-settings from
# ~/.bash.d/pre, then normal settings from ~/.bash.d, then post-settings
# from ~/.bash.d/post .
if [ -d $HOME/.bash.d ]; then
    if [ -d $HOME/.bash.d/pre ]; then
        configs=`find $HOME/.bash.d/pre -xtype f`
        for config in $configs; do
            . $config
        done
    fi

    configs=`find $HOME/.bash.d -xtype f`
    for config in $configs; do
        if [ -f $config ]; then
            source $config
        fi
    done

    if [ -d $HOME/.bash.d/post ]; then
        configs=`find $HOME/.bash.d/post -xtype f`
        for config in $configs; do
            source $config
        done
    fi
fi

