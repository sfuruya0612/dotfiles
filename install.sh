# /bin/sh

REPO="${HOME}/dotfiles"
VIMRC_PATH="${HOME}/.vimrc"
TMUX_PATH="${HOME}/.tmux.conf"
ZSHRC_PATH="${HOME}/.zshrc"
ZPROFILE_PATH="${HOME}/.zprofile"

echo "[INFO]: Start dotfiles install.\n"

echo "[INFO]: Homebrew existence check."
type brew
if [ $? != 0 ]; then
    echo "[INFO]: Install Homebrew.\n"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew upgrade
    brew doctor
fi

echo "[INFO]: Require packages install.\n"
brew install \
    zsh \
    zsh-autosuggestions \
    zsh-completions \
    zsh-syntax-highlighting \
    colordiff \
    tmux \
    urlview \
    reattach-to-user-namespace \
    jq \
    vim \
    asdf \
    coreutils \
    gpg \
    ctags \
    tree \
    fzf \
    telnet \
    python3

/usr/local/bin/pip3 install -U neovim

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# Font(Melso LG S Regular for Powerline 13Pt)
# clone
#git clone https://github.com/powerline/fonts.git --depth=1
# install
#cd fonts
#./install.sh
# clean-up a bit
#cd ..
#rm -rf fonts

echo "[INFO]: Replacing Symbolic Links.\n"

# vimrc
if [ -e ${VIMRC_PATH} ]; then
    if [ -L ${VIMRC_PATH} ]; then
        echo "[INFO]: Unlink vimrc."
        unlink ${VIMRC_PATH}
        break
    fi
    echo "[INFO]: Remove vimrc to vimrc_org."
    mv ${VIMRC_PATH} ${VIMRC_PATH}_org
fi
echo "[INFO]: Symbolic link in vimrc.\n"
ln -s ${REPO}/vim/vimrc ${VIMRC_PATH}

# tmux.conf
if [ -e ${TMUX_PATH} ]; then
    if [ -L ${TMUX_PATH} ]; then
        echo "[INFO]: Unlink tmux.conf."
        unlink ${TMUX_PATH}
        break
    fi
    echo "[INFO]: Remove tmux.conf to tmux.conf_org."
    mv ${TMUX_PATH} ${TMUX_PATH}_org
fi
echo "[INFO]: Install tmux plugin manager.\n"
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm

echo "[INFO]: Symbolic link in tmux.conf.\n"
ln -s ${REPO}/tmux/tmux.conf ${TMUX_PATH}

# zprofile
if [ -e ${ZPROFILE_PATH} ]; then
    if [ -L ${ZPROFILE_PATH} ]; then
        echo "[INFO]: Unlink zprofile."
        unlink ${ZPROFILE_PATH}
        break
    fi
    echo "[INFO]: Remove zprofile to zprofile_org."
    mv ${ZPROFILE_PATH} ${ZPROFILE_PATH}_org
fi
echo "[INFO]: Symbolic link in zprofile.\n"
ln -s ${REPO}/zsh/zprofile ${ZPROFILE_PATH}

# zshrc
if [ -e ${ZSHRC_PATH} ]; then
    if [ -L ${ZSHRC_PATH} ]; then
        echo "[INFO]: Unlink zshrc."
        unlink ${ZSHRC_PATH}
        break
    fi
    echo "[INFO]: Remove zshrc to zshrc_org."
    mv ${ZSHRC_PATH} ${ZSHRC_PATH}_org
fi
echo "[INFO]: Symbolic link in zshrc.\n"
ln -s ${REPO}/zsh/zshrc ${ZSHRC_PATH}

echo "[INFO]: Check symbolic links."
echo "$ tree -al -L 1 ${HOME} | grep '\->'"
tree -a -L 1 ${HOME} | grep "\->"

echo "\n[INFO]: Change shell to zsh."
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

echo "\n[INFO]: Install finished."
