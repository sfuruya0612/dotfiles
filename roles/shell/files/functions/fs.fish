# fs (fzf + ssh)
# Interactively select a registered ssh host
function fs
    set -l sshHost (grep -iE "^host" ~/.ssh/config | awk '{print $2}' | grep -v "#" | fzf)

    if test "$sshHost" = ""
        return 1
    end

    ssh $sshHost
end
