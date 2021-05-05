# fabian gunzinger's .bashrc


# aliases
############################################################################

# temp
alias dto='cd ~/dev/projects/applications/assignments/tesco'


# bash
alias la='ls -a'
alias ll='ls -oh'
alias lla='ls -aho'
alias lg='lla | grep $1'
alias copy='pwd | pbcopy'


alias tf='terraform'
alias tm='tmux'
alias tmkss='tmux kill-session'
function tma() { tmux attach-session -t "$1"; }
alias vim='nvim'

# blog shortcuts
alias nb='open https://fabiangunzinger.github.io/blog/'
pn() { nvim $(date +'%Y-%m-%d-')"$1"; }
pe() { nvim $(find . -name *$1*); }

# # projects
# alias dit='cd ~/dev/projects/dotfiles/.itermocil'
# alias itt='itermocil tracker'
# alias itb='itermocil blog'
# complete -W "$(itermocil --list)" itermocil

# projects
alias ptr='dtr; nvim'

# navigation
alias dde='cd ~/dev'
alias dpr='cd ~/dev/projects'
alias dre='cd ~/dev/remote'
alias dli='cd ~/dev/projects/limo'
alias dcl='cd ~/dev/projects/clean-cleaning'
alias dap='cd ~/dev/projects/applications'
alias dha='cd ~/dev/projects/habits/'
alias dhat='cd ~/dev/projects/habits/text'
alias dle='cd ~/dev/projects/learning/'
alias dml='cd ~/dev/projects/mlbt/'
alias dbl='cd ~/dev/projects/blog'
alias dblp='cd ~/dev/projects/blog/_posts'
alias dbln='cd ~/dev/projects/blog/_notebooks'
alias dfo='cd ~/dev/projects/food-tracker'
alias dtr='cd ~/dev/projects/te/tracker'
alias dtra='cd ~/dev/projects/te/admin'
alias ddf='cd ~/dev/projects/dotfiles'

alias dfa='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/fab'
alias drev='dfa; cd edu/wbs/reviews'
alias dsu='cd ~/setup/SublimeProjects'
alias dad='cd ~/Library/Application\ Support/Stata/ado/personal'
alias dla='cd /Users/fgu/Library/texmf/tex/latex/styfiles/'
alias dju='cd /Users/fgu/Library/Jupyter/snippets'
alias dte='cd /Users/fgu/tmp'

# dotfiles
alias fb='nvim ~/.bashrc'
alias sb='source ~/.bashrc'
alias ftm='nvim ~/.tmux.conf'
alias fv='nvim ~/.config/nvim/init.vim'

alias juno='jupyter notebook'
alias jula='jupyter lab'
alias clh='open -a safari https://localhost:9999'
alias sdo='StataSE -e do'

# git
alias gs='git status -u'
alias ga='git add --all'
alias gp='git push'
alias gl='git log --oneline'
function gac() { git add --all; git commit -m "$1"; }
function gc() { git commit -m "$1"; }
function gg() { git add --all; git commit -m "$1"; git push; }
function gb() { git branch; }
function gco() { git checkout "$1"; }
function gcm() { git checkout main; }
function gcmm() { git checkout master; }
function gcd() { git checkout dev; }
function gm() { git merge "$1"; }
function gmd() { git merge dev; }
function gmm() { gcm; gmd; gp; gcd; }
function gcb() { git checkout -b "$1"; }
function gbd() { git branch -d "$1"; }
function gbn() { git config branch.$( git branch --show-current ).note "$1"; }
function grc() { git rm --cached $1; }

# conda
function ca() { conda activate "$1"; }
function ce() { conda deactivate; }
alias cl='conda list'
function cik() { python -m ipykernel install --user --name "$1"; }

# pandoc
function pdmp() { pandoc "$1" -o "${1/md/pdf}"; } 

# GitHub cli autocomplete
# eval "$(gh completion -s bash)"


# aws (on Macbook)
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# 
# commands with a prefix are for my personal account and instance; those with
# at prefix, for uk-tracker account and instance.

# connect (with local host forwarding)
# to my ec2
alias aco='ssh -X -i ~/.aws/fgu-ec2-key.pem -L 9999:localhost:9999 ec2-user@ec2-18-130-22-104.eu-west-2.compute.amazonaws.com'
# to tracker as fgu
alias atco='ssh -i ~/.aws/ec2-tracker-fgu.pem -L 9999:localhost:9999 fgu@ec2-18-135-13-11.eu-west-2.compute.amazonaws.com'
# to tracker as default user
alias atcod='ssh -i ~/.aws/ec2-tracker-ec2user.pem -L 9999:localhost:9999 ec2-user@ec2-18-135-13-11.eu-west-2.compute.amazonaws.com'

# instance info
alias adi='aws ec2 describe-instances --filters Name=owner-id,Values=481079503739'
alias atdi='aws ec2 describe-instances --filters Name=owner-id,Values=934342343463'
alias ais='aws ec2 describe-instance-status --instance-ids i-035ee6232fc6eb131'
alias atis='aws ec2 describe-instance-status --instance-ids i-07803e23266a1d0fd'

# start and stop instance
alias asta='aws ec2 start-instances --instance-ids i-035ee6232fc6eb131'
alias asto='aws ec2 stop-instances --instance-ids i-035ee6232fc6eb131'

# mount and unmount project dir

mac_ip=80.43.66.208
mac_remote=/Users/fgu/dev/remote
mac_pem=/Users/fgu/.aws/ec2-tracker-fgu.pem
te_ip=18.135.13.11
te_remote=/home/fgu/dev/remote


alias mmat='sshfs fgu@$te_ip:$te_remote $mac_remote -o identityfile=$mac_pem; echo $te_remote mounted'

alias amo='sshfs ec2-user@18.130.22.104:/home/ec2-user/dev/projects/ /Users/fgu/dev/remote_projects/ -o IdentityFile=/Users/fgu/.aws/fgu-ec2-key.pem'

alias atmo='sshfs fgu@18.135.13.11:/home/fgu/dev/projects/uk-tracker /Users/fgu/dev/remote/ -o identityfile=/users/fgu/.aws/ec2-tracker-fgu.pem'

alias um='umount -f ~/dev/remote; echo "Unmounted"'


# open RStudio server
alias atrs='open -a safari http://ec2-18-135-13-11.eu-west-2.compute.amazonaws.com:8787'

# download file from ec2 to Mac
function atdl() { scp -i ~/.aws/ec2-tracker-fgu.pem fgu@ec2-18-135-13-11.eu-west-2.compute.amazonaws.com:$1 $2; }

function atul() { scp -i ~/.aws/ec2-tracker-fgu.pem $1 fgu@ec2-18-135-13-11.eu-west-2.compute.amazonaws.com:/data; }


# copy files from a to b
function asy() { aws s3 sync $1 $2; }

# list running processes with keyword
alias larp='ps aux'
function lrp() { ps aux | grep $1; }

# pull latest fable data
alias getfable='aws s3 sync s3://euhistoricaldatav1 s3://raw-fable'
# alias atjc='ssh -i ~/.aws/fgu-tracker-key.pem -N -f -L 9999:localhost:9999 ec2-user@ec2-3-8-141-132.eu-west-2.compute.amazonaws.com'


# alias atco='ssh -i ~/.aws/fgu-tracker-key.pem ec2-user@ec2-3-8-141-132.eu-west-2.compute.amazonaws.com'
#
# alias atjc='ssh -i ~/.aws/fgu-tracker-key.pem -N -f -L 9999:localhost:9999 ec2-user@ec2-3-8-141-132.eu-west-2.compute.amazonaws.com'


# alias atde='aws ec2 describe-instances'
# alias atst='aws ec2 describe-instance-status --instance-ids i-035ee6232fc6eb131'
# alias atmo='sshfs ec2-user@18.130.22.104:/home/ec2-user/dev/projects/ /Users/fgu/dev/remote_projects/ -o IdentityFile=/Users/fgu/.aws/fgu-ec2-key.pem'
# alias atum='umount -f /Users/fgu/dev/remote_projects'
# alias atsa='aws ec2 start-instances --instance-ids i-035ee6232fc6eb131'
# alias atso='aws ec2 stop-instances --instance-ids i-035ee6232fc6eb131'


# aws tracker ubuntu instance
# 3.8.201.147

alias ate='ssh -i ~/.aws/ec2-tracker-fgu.pem -L 9999:localhost:9999 ubuntu@ec2-52-56-193-5.eu-west-2.compute.amazonaws.com'


# upload latest experian data 
alias atue='aws s3 mv ~/Downloads/ s3://3di-data-experian/raw --recursive
--exclude "*" --include "uofn_*" --profile "tracker-fgu'



# environment settings
##############################################################################

# prompt
# details: https://youtu.be/LXgXV7YmSiU. colors: 256color_chart.svg
blue=$(tput setaf 033)
green=$(tput setaf 034)
white=$(tput setaf 15)
orange=$(tput setaf 208)
bold=$(tput bold)
reset=$(tput sgr0)

PS1="\[${bold}\]\n";
PS1+="\[${blue}\]\u";       # username
PS1+="\[${white}\]@";
PS1+="\[${orange}\]\h";     # host
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\W";      # basename of working directory
PS1+="\[${reset}\] $ ";
export PS1;

# path
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"      # use gnu grep
