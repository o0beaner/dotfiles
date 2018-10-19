bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

if [ -e "/usr/local/bin/aws_zsh_completer.sh" ]; then
  source "/usr/local/bin/aws_zsh_completer.sh"
fi

if [ -e "/usr/bin/aws_zsh_completer.sh" ]; then
  source "/usr/bin/aws_zsh_completer.sh"
fi

alias vi=vim
alias sudo='sudo -E'
alias ll="ls -lah"
alias zrc="vi ~/.zshrc"
alias tl="tmux list-sessions"
alias tc="tmux attach"
alias tcc="tmux -CC attach"
alias tk="tmux kill-session -t"
alias rlz=". ~/.zshrc"
alias kat="killall tmux"
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias sshgen='~/.ssh/config_gen'
alias emrssh='aws emr ssh --cluster-id'
alias emrsshg='aws emr ssh --endpoint-url http://aws157-preprod-sa-east-1.gru.proxy.amazon.com --region sa-east-1 --cluster-id'
alias sift='sift --follow'
alias ss="sudo ss -n4p | sed -Ee 's/users:\(\(//g' -e 's/\"//g' -e 's/pid=([0-9]+).+/\1/g'| column -t"
alias sst="sudo ss -tn4p | sed -Ee 's/users:\(\(//g' -e 's/\"//g' -e 's/pid=([0-9]+).+/\1/g'| column -t"
alias ssu="sudo ss -un4p | sed -Ee 's/users:\(\(//g' -e 's/\"//g' -e 's/pid=([0-9]+).+/\1/g'| column -t"
alias ssl="sudo ss -tuln4p | sed -Ee 's/users:\(\(//g' -e 's/\"//g' -e 's/pid=([0-9]+).+/\1/g'| column -t"
alias ps='ps waux'
alias grep='sift'
function lsapp() {
    appID=$1
    baseLog=$(sift -riz --no-filename --ipath=resourcemanager -e "$appID.*MasterContainer")
    AMContainerID=$(echo $baseLog | sift --only-matching -e "container_(\d|_)+")
    AMNode=$(echo $baseLog | sift --only-matching -e "ip-(\d|-)+")
    ICLog=$(sift -rizl --limit=1 --file-matches=InstanceJointStatusMap --ipath=daemons/instance-controller $AMNode | sort | tail -1)
    AMInstanceID=$(sift -riz --limit=1 $AMNode $ICLog | awk '{print $1}')
    # appLogs
    startTime=$(sift -riz --no-filename --ipath=resourcemanager -e "$appID.*to submitted" | awk '{print $1, $2}')
    endTime=$(sift -riz --no-filename --ipath=resourcemanager -e "application removed.*$appID.* queue" | awk '{print $1, $2}')
    echo Application ID: $appID
    echo AM Node: $AMNode - $AMInstanceID
    echo AM Container: $AMContainerID
    echo Application Runtime: $startTime - $endTime
}

function lscontainer() {
    containerID=$1
    containerHostname=$(sift -riz --no-filename --ipath=resourcemanager -e "assigned container $containerID" | sift --only-matching -e "ip-(\d|-)+")
    ICLog=$(sift -rizl --limit=1 --file-matches=InstanceJointStatusMap --ipath=daemons/instance-controller $containerHostname | sort | tail -1)
    containerInstanceID=$(sift -riz --limit=1 $containerHostname $ICLog | awk '{print $1}')
    echo Hostname : $containerHostname \|\| InstanceID : $containerInstanceID
}

export PATH=$PATH:~/.local/bin:/usr/local/bin:/apollo/env/SDETools/bin:/apollo/env/JavaSE8/bin:/apollo/env/envImprovement/bin:/opt/maven/bin  # MIDWAY PATH: Path changed for ssh
export LC_ALL=en_US.UTF-8


