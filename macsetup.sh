


# Xcode
xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Create SSH key
ssh-keygen -t ed25519

# GitHub CLI
brew install gh

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

# pyenv-virtualenv for virtual envs
brew install pyenv-virtualenv
pyenv virtualenv base   # gets automatically activated on shell startup (see .zshrc)

# Poetry for package installation and dependency resolution
curl -sSL https://install.python-poetry.org | python3 -
poetry config virtualenvs.create false  # don't use poetry for virtualenv mgt

# Base virtual environment with jupyterlab installed
mkdir ~/dev/projects/base
cd ~/dev/projects/base
pyenv virtualenv 3.10.8 base
potry init

poetry add jupyterlab
# customise jupyterlab - code formatter, etc.

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





# nvim
brew install nvim
pip3 install pynvim   # enable nvim to use python plugins
# set python interpreter manually (see init.vim)






# Vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# ... install homebrew


brew tap hashicorp/tap
brew install hashicorp/tap/terraform

brew install fzf
$(brew --prefix)/opt/fzf/install

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
poetry config virtualenvs.create false
poetry completions bash > $(brew --prefix)/etc/bash_completion.d/poetry.bash-completion

# miniconda install (check that it contains python version you want)
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh
rm Miniconda3-latest-MacOSX-x86_64.sh
