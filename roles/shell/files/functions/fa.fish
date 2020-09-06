# fa (fzf + export aws credential)
# Interactively select a registered AWS credential
function fa
    set -l awsProfile (grep "\[profile" ~/.aws/config | sed 's/^\[profile\ \(.*\)\]$/\1/g' | grep -v "#" | fzf)

    if test $awsProfile = ""
        return 1
    end

    echo "Set AWS credential: $awsProfile"
    set -g -x AWS_PROFILE $awsProfile
end
