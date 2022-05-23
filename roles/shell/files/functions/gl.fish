# gl (git log + fzf)
# Interactively preview git log
function gl
    git log --color=always --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
    | fzf --preview "echo {} | string split ' ' | head -1 | xargs git show --color=always"
end
