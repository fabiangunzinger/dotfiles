#
# fabian gunzinger's .bashrc
#


# aliases
############################################################################

# navigation
alias la='ls -a'
alias ll='ls -o'
alias lla='ls -ao'
alias copy='pwd | pbcopy'

alias dde='cd ~/dev'
alias dpr='cd ~/dev/projects'
alias drp='cd ~/dev/remote_projects'
alias dli='cd ~/dev/projects/limo'
alias dap='cd ~/dev/projects/applications'
alias dha='cd ~/dev/projects/habits/'
alias dle='cd ~/dev/projects/learning/'
alias dbl='cd ~/dev/projects/blog'
alias dblp='cd ~/dev/projects/blog/_posts'
alias dfo='cd ~/dev/projects/food-tracker'
alias dtr='cd ~/dev/projects/uk-tracker'
alias ddo='cd ~/dev/projects/dotfiles'

alias dsu='cd ~/setup/SublimeProjects'
alias dad='cd ~/Library/Application\ Support/Stata/ado/personal'
alias dla='cd /Users/fgu/Library/texmf/tex/latex/styfiles/'
alias dju='cd /Users/fgu/Library/Jupyter/snippets'
alias dte='cd /Users/fgu/tmp'

# dotfiles
alias fbash='vim ~/.bashrc'
alias sbash='source ~/.bashrc'
alias fvim='vim ~/.vim/vimrc'

alias juno='jupyter notebook'
alias jula='jupyter lab'
alias clh='open -a safari https://localhost:9999'
alias sdo='StataSE -e do'

# git
alias gs='git status'
alias ga='git add --all'
function gc() { git commit -m "$1"; }
function gg() { git add --all; git commit -m "$1"; git push; }
alias gp='git push'
alias gl='git log'

# conda
function ca() { conda activate "$1"; }
function ce() { conda deactivate; }
alias cl='conda list'


# aws (on Macbook)
############################################################################

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

# mount and unmount project dir, so I can access and edit ec2 files locally
alias amo='sshfs ec2-user@18.130.22.104:/home/ec2-user/dev/projects/ /Users/fgu/dev/remote_projects/ -o IdentityFile=/Users/fgu/.aws/fgu-ec2-key.pem'
alias atmo='sshfs fgu@18.135.13.11:/home/fgu/dev/projects/uk-tracker /Users/fgu/dev/remote_projects/ -o IdentityFile=/Users/fgu/.aws/ec2-tracker-fgu.pem'
alias aum='umount -f /Users/fgu/dev/remote_projects'

# open RStudio server
alias atrs='open -a safari http://ec2-18-135-13-11.eu-west-2.compute.amazonaws.com:8787'

# download file from ec2 to Mac
function atdl() { scp -i ~/.aws/ec2-tracker-fgu.pem fgu@ec2-18-135-13-11.eu-west-2.compute.amazonaws.com:$1 ~/Downloads/; }

function atul() { scp -i ~/.aws/ec2-tracker-fgu.pem $1 fgu@ec2-18-135-13-11.eu-west-2.compute.amazonaws.com:/data; }


# copy files from a to b
function asy() { aws s3 sync $1 $2; }

# list running processes with keyword
function lrp() { ps aux | grep $1; }



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
