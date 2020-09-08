#
#       __ _     _
#      / _(_)___| |__
#     | |_| / __| '_ \
#     |  _| \__ \ | | |
#     |_| |_|___/_| |_|
#

# Export path
# asdf path
source (brew --prefix asdf)/asdf.fish

# Go path
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Universal environment
# Editors path
set -U EDITOR /usr/local/bin/nvim
set -U VISUAL /usr/local/bin/nvim
set -U PAGER /usr/bin/less

# Set history options
set -U HISTSIZE 10000
set -U SAVEHIST 100000

# Set theme
set -U TERM xterm-256color

# Alias
# Linux option
alias ls "gls --color=auto -F"
alias ll "ls -aFGl"
# Git
alias gcd "cd (git rev-parse --show-toplevel)"
alias gs "git status"
alias gd "git diff"
alias gp "git pull"
alias gg "git grep"
# alias gl "git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" | fzf --preview "echo {} | awk '{print \$2}' | xargs git show --color=always""
# alias gb "git checkout `git branch -a | tr -d " " | fzf --preview "git log --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g"`"
# Docker
alias dp "docker ps"
alias dpa "docker ps -a"
alias dr "docker run"
alias de "dokcer exec"
alias dk "docker kill"
alias dka "docker kill (docker ps -q)"
alias dcp "docker container prune -f"
# Editor
alias vim (brew --prefix)/bin/nvim

# Set fzf options
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git"'
set -x FZF_DEFAULT_OPTS '--no-sort --exact --cycle --exit-0 --select-1 --multi --ansi --height 50% --reverse --border --prompt=">>> " --bind=ctrl-j:preview-down --bind=ctrl-k:preview-up'

# Set prompt
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes

set -g theme_show_exit_status yes
set -g theme_color_scheme dracula
set -g theme_newline_cursor yes
set -g theme_powerline_fonts yes

set -g theme_display_cmd_duration yes
set -g theme_display_jobs_verbose yes

set -g theme_display_date yes
set -g theme_date_timezone Asia/Tokyo
set -g theme_date_format "+%a %T"

set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_use_abbreviated_path no

# Init function
# Attach tmux session at launch new terminal
function attach_tmux_session_if_needed
    set ID (tmux list-sessions)
    if test -z "$ID"
        tmux new-session
        return
    end

    set new_session "Create New Session"
    set ID (echo $ID\n$new_session | fzf | cut -d: -f1)
    if test "$ID" = "$new_session"
        tmux new-session
    else if test -n "$ID"
        tmux attach-session -t "$ID"
    end
end

if test -z $TMUX && status --is-login
    attach_tmux_session_if_needed
end
