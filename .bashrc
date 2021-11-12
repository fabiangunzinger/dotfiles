# fabian gunzinger's .bashrc


#################################################
# aliases
#################################################

# temp
alias dgu='cd ~/dev/projects/gutenberg'
alias dpp='cd ~/dev/projects/preproc'

# bash
alias sb='source ~/.bashrc'
alias la='ls -a'
alias ll='ls -oh'
alias lla='ls -aho'
alias lg='lla | grep $1'
alias cpwd='pwd | pbcopy'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias rmd='rm -rfi '

# running processes
alias p='ps aux | grep '
alias pt='ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10'

# search file in current folder
alias f='find . | grep '

# system shutdown (also shuts down aws instance) and reboots
alias ss='atesp; sudo shutdown -h now'
alias sr='sudo shutdown -r now'

# start of day
alias jk='open /System/Applications/Calendar.app; open /System/Applications/Notes.app'

# disk space and directory structure
alias dum='du -h | sort -n -r | more'
alias dud='du -h -d 2'
alias t='tree -CAhF --dirsfirst'
alias td='tree -CAFd'

# terraform
alias tf='terraform'
alias tfi='tf init'
alias tfa='tf apply'
alias tfo='tf output'
alias tfoi='tf output instance_id'

# commands
alias jula='jupyter lab'
alias clh='open -a safari https://localhost:9999'
alias sdo='StataSE -e do'
alias tfs='tf show'
alias tfd='tf destroy'
alias tm='tmux'
alias tmkss='tmux kill-session'
function tma() { tmux attach-session -t "$1"; }
alias vi='nvim'
alias vgp='vimgolf put '

# go to directory
alias daw='cd ~/.aws'
alias dde='cd ~/dev'
alias dpr='dde; cd projects'
alias drm='dde; cd remote'
alias dli='cd ~/dev/projects/limo'
alias dcl='cd ~/dev/projects/clean-cleaning'
alias dap='cd ~/dev/projects/applications'
alias dapc='cd ~/dev/projects/applications/interview-prep/code'
alias dfa='cd ~/dev/projects/fabiangunzinger.github.io'
alias den='cd ~/dev/projects/entropy/'
alias dent='den; cd text'
alias deni='den; cd infra'
alias dle='cd ~/dev/projects/learning/'
alias dth='cd ~/dev/projects/learning/think-python'
alias dml='cd ~/dev/projects/mlbt/'
alias dmlp='cd ~/dev/projects/mlbt/text/paper'
alias dmd='cd ~/dev/projects/mdb/'
alias dbl='dpr; cd blog'
alias dblp='dbl; cd _posts'
alias dbln='dbl; cd _notebooks'
alias dfo='cd ~/dev/projects/food-tracker'
alias dte='cd ~/dev/projects/tracktheeconomy'
alias dtea='cd ~/dev/projects/te/admin'
alias dter='cd ~/dev/projects/te/research'
alias ddf='cd ~/dev/projects/dotfiles'
alias dsu='cd ~/setup/SublimeProjects'
alias dad='cd ~/Library/Application\ Support/Stata/ado/personal'
alias dla='cd /Users/fgu/Library/texmf/tex/latex/styfiles/'
alias dju='cd /Users/fgu/Library/Jupyter/snippets'
alias dic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias dfab='dic; cd fab'
alias dre='dfab; cd library/resources'
alias dpa='dfab; cd library/papers'

# open directory
alias ore='dre; open .'
alias opa='dpa; open .'

# files
alias fb='vi ~/.bashrc'
alias ftm='vi ~/.tmux.conf'
alias fvr='vi ~/.config/nvim/init.vim'
alias fve='cd ~/dev/projects/blog/_posts/; pe vim-essentials.md'
alias fre='vi ~/dev/projects/blog/_posts/2021-09-11-regex.md'
alias frc='open ~/'

# activate project
alias abl='dbl; ca blog'
alias aen='den; ca entropy'
alias afo='dfo; ca foods'
alias amd='dmd; ca mdb'
alias ate='dte; ca te'

# start jupyter lab for project
alias jbl='abl; jula'
alias jen='aen; jula'
alias jfo='afo; jula'
alias jmd='amd; jula'
alias jte='ate; jula'

# misc.
alias pre='open https://regex101.com; open https://www.regular-expressions.info;
open https://www.rexegg.com; open https://docs.python.org/3/library/re.html;
open https://bitbucket.org/mrabarnett/mrab-regex/src/hg/; jbl'


# blog shortcuts
alias nb='open https://fabiangunzinger.github.io/blog/'
pn() { vi $(date +'%Y-%m-%d-')"$1"; }
pe() { vi $(find . -name *$1*); }

# git
alias gs='git status -u'
alias ga='git add --all'
alias gp='git push'
alias gl='git log --oneline'
function gac() { git add --all; git commit -m "$1"; }
# function gam() { git add --all; git commit --amend --no-edit; } # not working
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
alias ci='conda install '
alias cl='conda list'
alias clg='conda list | grep '
function ca() { conda activate "$1"; }
function ce() { conda deactivate; }
function ik() { python -m ipykernel install --user --name "$1"; }
function cee() { conda env export --name "$1" > environment.yml; }

# pandoc
function pdmp() { pandoc "$1" -o "${1/md/pdf}"; } 

# GitHub cli autocomplete
# eval "$(gh completion -s bash)"

# initialise cookiecutter project
alias cc='cookiecutter https://github.com/drivendata/cookiecutter-data-science
'


#################################################
# aws
#################################################


mac_ip=$(curl -s ifconfig.me)
mac_remote=/Users/fgu/dev/remote
vm_remote=/home/fgu/dev/remote
localhost_forward=9999:localhost:9999 

te_keypair=/Users/fgu/.aws/3di.pem
instance_id=i-0d38c6fcdfb909b7b

alias get_dns="aws ec2 describe-instances \
    --instance-ids $instance_id \
    --query 'Reservations[].Instances[].PublicDnsName' \
    --profile '3di' \
    --region 'eu-west-2' \
    --output 'text'"
te_dns=$( get_dns )

# start and stop instance
tail='--profile 3di --region eu-west-2'
alias atesp='aws ec2 stop-instances --instance-ids $instance_id $tail'
alias atest='aws ec2 start-instances --instance-ids $instance_id $tail'

# connect to ec2 instances
alias atec='ssh -i $te_keypair -L $localhost_forward fgu@$te_dns'
alias atecu='ssh -i $te_keypair -L $localhost_forward ubuntu@$te_dns'

# fetch latest fable data
source=s3://fd-eu-rowlevel-v2
destination=s3://3di-data-fable/raw/
alias getfable="aws s3 sync $source $destination --profile '3di'"

# copy files from a to b
function acp() { aws s3 cp $1 $2; }
function acpt() { aws s3 cp $1 $2 --profile '3di'; }

## to my ec2
#alias aco='ssh -X -i ~/.aws/fgu-ec2-key.pem -L 9999:localhost:9999 ec2-user@ec2-18-130-22-104.eu-west-2.compute.amazonaws.com'

## to tracker as default user
#alias atcod='ssh -i ~/.aws/ec2-tracker-ec2user.pem -L 9999:localhost:9999 ec2-user@ec2-18-135-13-11.eu-west-2.compute.amazonaws.com'


## instance info
#alias adi='aws ec2 describe-instances --filters Name=owner-id,Values=481079503739'
#alias atdi='aws ec2 describe-instances --filters Name=owner-id,Values=934342343463'
#alias ais='aws ec2 describe-instance-status --instance-ids i-035ee6232fc6eb131'
#alias atis='aws ec2 describe-instance-status --instance-ids i-07803e23266a1d0fd'

## start and stop instance
#alias asta='aws ec2 start-instances --instance-ids i-035ee6232fc6eb131'
#alias asto='aws ec2 stop-instances --instance-ids i-035ee6232fc6eb131'

## mount and unmount project dir

#alias mmat='sshfs fgu@$te_ip:$te_remote $mac_remote -o identityfile=$mac_pem; echo $te_remote mounted'

#alias amo='sshfs ec2-user@18.130.22.104:/home/ec2-user/dev/projects/ /Users/fgu/dev/remote_projects/ -o IdentityFile=/Users/fgu/.aws/fgu-ec2-key.pem'

#alias atmo='sshfs fgu@18.135.13.11:/home/fgu/dev/projects/uk-tracker /Users/fgu/dev/remote/ -o identityfile=/users/fgu/.aws/ec2-tracker-fgu.pem'

#alias um='umount -f ~/dev/remote; echo "Unmounted"'


## download file from ec2 to Mac
#function atdl() { scp -i ~/.aws/ec2-tracker-fgu.pem fgu@ec2-18-135-13-11.eu-west-2.compute.amazonaws.com:$1 $2; }

#function atul() { scp -i ~/.aws/ec2-tracker-fgu.pem $1 fgu@ec2-18-135-13-11.eu-west-2.compute.amazonaws.com:/data; }


## aws cli with tracker-uk profile
#function awst() { aws "$@" --profile "tracker-fgu"; }


## upload latest experian data 
#alias atue='aws s3 mv ~/Downloads/ s3://3di-data-experian/raw --recursive
#--exclude "*" --include "uofn_*" --profile "tracker-fgu'

## update local app data (pull from aws)
#alias gad="aws s3 cp s3://3di-project-te/app/ ~/dev/projects/te/tracker/app/data/ --recursive --profile 'tracker-fgu'"


#################################################
# exports
#################################################

export FABIB=~/dev/projects/dotfiles/latex/fabib.bib
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"      # use gnu grep
export EDITOR=nvim
export VISUAL="$EDITOR"


#################################################
# prompt
#################################################

# heavily based on https://youtu.be/LXgXV7YmSiU. colors: 256color_chart.svg
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

