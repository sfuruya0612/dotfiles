# fs (fzf + ssh)
# Interactively select a registered ssh host
function fs
    set -l sshHost (grep -E "^Host" ~/.ssh/conf.d/* | awk '{print $2}' | grep -v "#" | grep -v '^[0-9]' | grep -v '^\*' | fzf)

    if test -z "$sshHost"
        echo "SSH host is not selected."
        return 1
    end

    ssh $sshHost
end
