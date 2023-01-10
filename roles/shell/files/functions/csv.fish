# View CSV file from the Command Line
function csv
    set -l csvFile $argv[1]

    if test -z "$csvFile"
        echo "CSV file is not specified."
        return 1
    end

    cat $csvFile | sed -e 's/,,/, ,/g' | column -s, -t | less -#5 -N -S
end
