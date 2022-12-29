# macbook setup
# fabian gunzinger

# Xcode
echo "Installing Xcode..."
xcode-select --install

# Homebrew
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Neovim
echo "Installing Neovim..."
brew install nvim
## Enable nvim to use python plugins
pip3 install pynvim   
## Python interpreter will be set automatically in init.vim

# GitHub
echo "Authenticate GitHub accounts..."
## Install GitHub CLI
brew install gh
## Create ssh keys and authenticate with GitHub accounts 
## Specify appropriate comment and file path and provide empty
## (new) passphrase to disable passphrase option
cd
## Personal account
echo "Authenticate personal account..."
ssh-keygen -t ed25519 -C "personal_gh" -f ".ssh/personal_gh" -N ""
gh auth login -h "github.com" -w
## Work account
ssh-keygen -t ed25519 -C "jet_gh" -f ".ssh/jet_gh" -N ""
gh auth login -h "github.je-labs.com" -w

# Configuration files
## Create directories
echo "Creating dev directories..."
cd
mkdir -p dev/projects
## Clone dotfiles
echo "Cloning dotfiles..."
cd dev/projects
git clone git@github.com:fabiangunzinger/dotfiles.git
## Create symlinks
echo "Creating symlinks to config files..."
cd
DOTFILES=~/dev/projects/dotfiles
ln -s $DOTFILES/zsh/.zshrc .
ln -s $DOTFILES/git/.gitconfig .
ln -s $DOTFILES/git/.gitignore_global .
ln -s $DOTFILES/ssh/config .ssh


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


# macOS applications
brew install pandoc
brew install --cask mactex
brew install --cask skype
brew install --cask spotify
brew install --cask skim
brew install --cask chrome
brew install --cask whatsapp
brew install --cask flux
brew install --cask firefox



# Stuff I might not need any longer

brew tap hashicorp/tap
brew install hashicorp/tap/terraform
# Latex


brew install fzf
$(brew --prefix)/opt/fzf/install

# miniconda install (check that it contains python version you want)
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
rm Miniconda3-latest-MacOSX-x86_64.sh
