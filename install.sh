# /bin/sh

REPO="${HOME}/dotfiles"

echo "[INFO]: Start dotfiles install."

echo "[INFO]: Homebrew existence check."
type brew
if [ $? != 0 ]; then
    echo "[INFO]: Install Homebrew."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew upgrade
    brew doctor
else
    echo "[INFO]: Homebrew exist."
fi

echo "[INFO]: Require packages install."
brew install \
    zsh \
    zsh-autosuggestions \
    zsh-completions \
    zsh-syntax-highlighting \
    colordiff \
    reattach-to-user-namespace \
    tmux \
    jq \
    vim \
    asdf

echo "[INFO]: Replacing Symbolic Links."

unlink ${HOME}/.vimrc
ln -s ${REPO}/vim/vimrc ~/.vimrc

unlink ${HOME}/.tmux.conf
ln -s ${REPO}/tmux/tmux.conf ~/.tmux.conf

unlink ${HOME}/.zprofile
ln -s ${REPO}/zsh/zprofile ~/.zprofile

unlink ${HOME}/.zshrc
ln -s ${REPO}/zsh/zshrc ~/.zshrc

echo "[INFO]: Change shell to zsh."
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

echo "[INFO]: Install finished."
