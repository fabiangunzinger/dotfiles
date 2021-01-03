
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/fgu/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/fgu/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/fgu/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/fgu/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# My settings
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
