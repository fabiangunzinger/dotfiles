# macbook setup
# fabian gunzinger

# Xcode
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# nvim
brew install nvim
# Enable nvim to use python plugins
pip3 install pynvim   
# set python interpreter manually (see init.vim)

# Create SSH key
cd
ssh-keygen -t ed25519

# GitHub CLI
brew install gh
## todo: add public key to Github so I can ssh into account

# Create project directory
cd
mkdir -p dev/projects

# Clone configuration files and activate with softlink to root directory
cd dev/projects
git clone git@github.com:fabiangunzinger/dotfiles.git
ln -s dev/projects/dotfiles/.zshrc ~
## Have separate config file for private and work projects
## See logic in .gitconfig
ln -s dev/projects/dotfiles/.gitconfig* ~

# Python
brew install pyenv
brew install openssl readline sqlite3 xz zlib tcl-tk
pyenv install 3.9
pyenv install 3.10
pyenv global 3.10

# Virtual environments
# pyenv-virtualenv for virtual env management
brew install pyenv-virtualenv
# base environment that gets automatically activated on shell startup
# and is used to run Jupyter (see .zshrc.general and workflow post)
pyenv virtualenv base   
pyenv activate base
pip install jupyterlab
## In case I decide to manage base dir with Poetry after all
# mkdir ~/dev/projects/base
# cd ~/dev/projects/base
# pyenv virtualenv 3.10.8 base
# potry init
# poetry add jupyterlab

# todo: configure Jupyter environment

# Dependency management
## Currently trying both pip and poetry

## Poetry installation
curl -sSL https://install.python-poetry.org | python3 -
# Don't use poetry for virtualenv mgt
poetry config virtualenvs.create false  
# poetry completions bash > $(brew --prefix)/etc/bash_completion.d/poetry.bash-completion

# Terminal
## Install iterm2
brew install --cask iterm2
## Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## Install patched powerline fonts required for some omz themes (e.g. agnoster).
#One of those fonts should be automatically selected when importing my iterm2
#settings. If now, manually select font (e.g. Menslo) for each profile.
sh -c "$(curl -fsSl https://raw.githubusercontent.com/powerline/fonts/master/install.sh)"
## Manually import iterm-profiles.json (iterm2/Profiles/Other actions)

## Install below prompt and customise
## todo: customise prompt
# https://github.com/agkozak/agkozak-zsh-prompt


# Stuff I might not need any longer

brew tap hashicorp/tap
brew install hashicorp/tap/terraform

brew install fzf
$(brew --prefix)/opt/fzf/install

# miniconda install (check that it contains python version you want)
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
rm Miniconda3-latest-MacOSX-x86_64.sh
