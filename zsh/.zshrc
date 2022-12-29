# jetmac .zshrc
# fabian gunzinger

source ~/dev/projects/dotfiles/zsh/zshrc.omz
source ~/dev/projects/dotfiles/zsh/zshrc.general
source ~/dev/projects/dotfiles/zsh/zshrc.jetmac

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fabian.gunzinger/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fabian.gunzinger/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fabian.gunzinger/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fabian.gunzinger/google-cloud-sdk/completion.zsh.inc'; fi
