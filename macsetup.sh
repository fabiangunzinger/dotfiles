

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
