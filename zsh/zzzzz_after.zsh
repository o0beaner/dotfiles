bindkey    "^[[3~"          delete-char
bindkey    "^[3;5~"         delete-char

if [[ "$platform" == 'linux' ]]; then
  source "/local/apollo/_env/SDETools-swit1na.14330535.278443717.1333350543/bin/aws_zsh_completer.sh" || true
fi

if [[ "$platform" == 'darwin' ]]; then
  source "/usr/local/bin/aws_zsh_completer.sh"
fi

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
export PATH=$PATH:/usr/local/bin:/apollo/env/SDETools/bin:/apollo/env/JavaSE8/bin:/apollo/env/envImprovement/bin:/opt/maven/bin  # MIDWAY PATH: Path changed for ssh
