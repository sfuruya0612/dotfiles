# c (Claude Code)
# Homebrew の cask で Claude Code を最新版に更新してから起動する
# Homebrew 版の Claude Code は自動更新されないため、起動のたびに更新する
function c --wraps=/opt/homebrew/bin/claude --description 'Upgrade Claude Code and launch it'
    set -l cask claude-code@latest

    # オフライン等で更新に失敗しても、インストール済みの版で起動を続ける
    if not /opt/homebrew/bin/brew upgrade --cask --quiet $cask
        echo "Failed to upgrade $cask. Launching the installed version." >&2
    end

    /opt/homebrew/bin/claude $argv
end
