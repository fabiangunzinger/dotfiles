# macbook setup
# fabian gunzinger
#
# todo
# - look into xcape to automatically configure modifier keys

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
ln -s $DOTFILES/nvim/init.vim ./.config/nvim
ln -s $DOTFILES/zsh/.zshrc .
ln -s $DOTFILES/git/.gitconfig .
ln -s $DOTFILES/git/.gitignore_global .
ln -s $DOTFILES/ssh/config .ssh
ln -s $DOTFILES/iterm2/starship.toml ./.config
ln -s $DOTFILES/tmux/.tmux.conf .

# Python
## Install pyenv and dependencies
## See https://github.com/pyenv/pyenv/wiki#suggested-build-environment
brew install openssl readline sqlite3 xz zlib tcl-tk
brew install pyenv
## Install Python versions
pyenv install 3.9
pyenv install 3.10
## Set default Python
pyenv global 3.10

# Virtual environments
## I manage virutal envs with pyenv-virtualenv
brew install pyenv-virtualenv
## Create a base environment that gets automatically activated on shell startup
## and is used to run Jupyter (see .zshrc.general and workflow post)
pyenv virtualenv base   
pyenv activate base
pip install jupyterlab
## todo: configure Jupyter environment
## todo: save all virtualenv configs somewhere so I can share across machines
## In case I decide to manage base dir with Poetry after all
# mkdir ~/dev/projects/base
# cd ~/dev/projects/base
# pyenv virtualenv 3.10.8 base
# potry init
# poetry add jupyterlab

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

## Install 'hack' nerd font using Homebrew
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
## Manually select desired font in iTerm (currently 'Hack Nerd Font')
## todo: select font automatically

## Manually import iterm2-profiles.json (iterm2/Profiles/Other actions)
## todo: automatically import iterm2-profiles.json

## Install starwhip prompt
brew install starship

# Install autocompletions extension
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

## Install fuzzy finder (FZF)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## Install ripgrep
brew install ripgrep

## Install zsh-z for directory jumping
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

## Install bat - the better cat
brew install bat

## Install tmux
## reattach-to-user-namespace utility allows scrolling in tmux (see
## here: https://thoughtbot.com/blog/tmux-copy-paste-on-os-x-a-better-future)
brew install tmux
brew install reattach-to-user-namespace


## Install battery
brew tap Goles/battery
brew install battery

# Misc
brew install htop


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
