# View log file from remote server on ssh
function stail
    set -l remoteHost $argv[1]
    set -l logType $argv[2]

    if test -z "$remoteHost"
        echo "Remote host is not specified."
        return 1
    end

    if test -z "$logType"
        echo "Target log file is not specified."
        return 1
    end

    set -g logFile /var/log/cloud-init-output.log
    switch $logType
        case cloud
            set logFile /var/log/cloud-init-output.log
        case nginx
            set logFile /var/log/nginx/access.log
        case syslog
            set logFile /var/log/syslog
        case '*'
            echo "Specified log type is not an option."
    end

    ssh $remoteHost tail -f $logFile
end
