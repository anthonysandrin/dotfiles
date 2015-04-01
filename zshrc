# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh/histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/anthony/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH=$PATH:/Users/anthony/Library/Haskell/bin:/Users/anthony/arm-cs-tools/bin

export RBENV_ROOT="$(brew --prefix rbenv)"
export GEM_HOME="$(brew --prefix)/opt/gems"
export GEM_PATH="$(brew --prefix)/opt/gems"

source $HOME/.config/zsh/zsh-git-prompt/zshrc.sh

ZSH_THEME_GIT_PROMPT_PREFIX="──┨"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{8}┠──"
ZSH_THEME_GIT_PROMPT_SEPARATOR="%F{8}│"

PROMPT='
%F{8}╭─┨%F{14}%n%F{11}@%F{4}%~%F{8}┠─$(git_super_status)╌┄
%F{8}╰─%F{8}▶%f'

function vim {
    echo "Did you mean nvim?"
    read -rs -k 1 ans
    case "${ans}" in
    y|Y|$'\n')
        nvim
            return 0
        ;;
    *)
        /usr/bin/vim
            return 1
    esac
}

alias ls="ls -G"
