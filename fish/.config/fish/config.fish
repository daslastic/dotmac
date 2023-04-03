if status is-interactive
    # Commands to run in interactive sessions can go here
end
if set -q SSH_TTY
  set -g fish_color_host brred
end

set -U fish_greeting

fish_add_path /opt/homebrew/bin
fish_vi_key_bindings

alias vim "nvim"
alias vi "nvim"
alias c "cd"
alias nvim "nvim"
alias ed "echo you need help"
alias ls "l"
alias l "lsd -lA --config-file ~/.config/lsd/config.yml"
alias lsc "ls --color=auto"
alias dc "sl"
alias cp "cp -ivr"
alias scp "scp -r"
alias mkdir "mkdir -r"
alias rm "rm -vI"
alias mv "mv -iv"
alias doas="sudo"
alias grep "grep --color=auto"
alias mkdir "mkdir -p"
alias ipa=" ifconfig en0 | grep 'inet\ ' | awk '{print $2}'"
alias diff "diff --color=auto"
alias ip "ip --color=auto"
alias wget "wget --hsts-file /tmp"
alias upgrade="brew upgrade --casks --greedy && brew update && brew cu --all && brew bundle  --file ~/.config/homebrew/Brewfile"

set -x DEVKIT "$HOME/.local/share/devkit"
set -x EDITOR "nvim"

# path
set -x CACHE_HOME "$HOME/.cache"
set -x CONFIG_HOME "$HOME/.config"
set -x DATA_HOME "$HOME/.local/share"
set -x BIN_HOME "$HOME/.local/bin"

# zsh
set -x HISTFILE $CACHE/.bash_history
set -x HISTCONTROL ignoreboth
set -x LESSHISTFILE "-"

# programs
set PATH $PATH $HOME/.local/bin
set PATH $PATH $DATA_HOME/npm/bin
set PATH $PATH /opt/homebrew/bin

set -x NPM_CONFIG_PREFIX "$DATA_HOME/npm"
set -x NPM_CONFIG_USERCONFIG "$CONFIG_HOME/npm/config"
set -x RUSTUP_HOME "$DATA_HOME/rustup"
set -x CARGO_HOME "$DATA_HOME/cargo"
set -x PATH "$CARGO_HOME/bin:$PATH"
set -x GOPATH "$DATA_HOME"/go
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_INSECURE_REDIRECT 1

# other
set -x PYTHONSTARTUP $CONFIG_HOME/python/pythonrc
set -x ANDROID_SDK_HOME "$CONFIG_HOME/android"

mkdir -p "$DATA_HOME/rustup"
mkdir -p "$CONFIG_HOME/android"
mkdir -p "$DATA_HOME/cargo"

direnv hook fish | source
starship init fish | source

source ~/.config/fish/iterm2_shell_integration.fish

set -gx PNPM_HOME "$HOME/.config/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
