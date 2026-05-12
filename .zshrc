export DOTFILES_DIR="$HOME/.dotfiles"
export TERRAFORM_DIR="$HOME/Code/terraform"
export ASDF_DIR="$HOME/.asdf"

export TFENV_ARCH=amd64
export GODEBUG=asyncpreemptoff=1
setopt NO_ERREXIT

test -e "$HOME/.autojump/etc/profile.d/autojump.sh"  && source "$HOME/.autojump/etc/profile.d/autojump.sh"

autoload -U add-zsh-hook
for util in $(ls -a "$DOTFILES_DIR/utils"); do
  source "$DOTFILES_DIR/utils/$util"
done

ulimit -n 10240

DISABLE_UNTRACKED_FILES_DIRTY="true"
unsetopt correct_all correct
setopt autocd autopushd
setopt NO_CASE_GLOB

bindkey '^u' backward-kill-line

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000
unsetopt share_history
unsetopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

export ZSH_CACHE_DIR=$HOME/.oh-my-zsh/cache
mkdir -p $ZSH_CACHE_DIR/completions

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
source <(antidote init)

fpath+=~/.zfunc
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

source ~/Code/ops/.claude/skills/create-jira-ticket/create-jira-ticket

antidote bundle <<EOBUNDLES
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions
  
  # Bundle OMZ plugins using annotations
  ohmyzsh/ohmyzsh path:plugins/magic-enter

  # Bundle with a git URL
  https://github.com/zsh-users/zsh-history-substring-search
  
  ohmyzsh/ohmyzsh path:plugins/command-not-found
  ohmyzsh/ohmyzsh path:plugins/docker
  ohmyzsh/ohmyzsh path:plugins/history
  ohmyzsh/ohmyzsh path:plugins/git
  ohmyzsh/ohmyzsh path:plugins/kubectl
EOBUNDLES

export ASDF_GOLANG_MOD_VERSION_ENABLED=true
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.dotfiles/bin"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
export PATH=$HOME/.istioctl/bin:$PATH

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export ASDF_HASHICORP_OVERWRITE_ARCH=amd64
export ASDF_KUBECTL_OVERWRITE_ARCH=amd64
export ASDF_DATA_DIR="$HOME/.asdf"
mkdir -p "$ASDF_DATA_DIR/completions"
asdf completion zsh > "$ASDF_DATA_DIR/completions/_asdf"

# append completions to fpath
fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

export EDITOR='code -w'
export KUBE_EDITOR='code -w'

export RACK_TIMEOUT=120
export TERM=xterm-256color
export UNICORN_TIMEOUT=1000

alias source_zsh='source ~/.zshrc'

alias la='ls -a'
alias a=argo
alias pboard_reset="ps aux | grep pboard | grep -v grep | awk '{ print $2 }' | xargs kill"

function ngrok-localhost {
  cd && ngrok http "http://localhost:$1" -subdomain=wuta
}

eval "$(jump shell)"
eval "$(kubectl completion zsh)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
. <(stern --completion=zsh)
. "$HOME/.config/op/plugins.sh"
. $DOTFILES_DIR/argo-completion.sh

function source-zsh {
  local source_gh
  source_gh="$1"

  echo "sourcing ~/.zshrc"
  source "$HOME/.zshrc"
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
test -e "./kind-completion.zsh" && source "./kind-completion.zsh"
export GPG_TTY=$(tty)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=''
_zsh_autosuggest_highlight_apply() {
  # No-op: Do nothing
}
setopt NO_ERREXIT

