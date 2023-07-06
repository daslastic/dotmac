if status is-interactive
  bind -M insert \cs 'fd --type d . ~ --hidden | fzf $FZF_DEFAULT_OPTS $fzf_directory_opts --preview "bat --color=always {}"'
  bind -M visual \cs 'fd --type d . ~ --hidden | fzf $FZF_DEFAULT_OPTS $fzf_directory_opts --preview "bat --color=always {}"'
  bind -M default \cs 'fd --type d . ~ --hidden | fzf $FZF_DEFAULT_OPTS $fzf_directory_opts --preview "bat --color=always {}"'
  bind -M insert \cf 'clear; commandline -f repaint'
  bind -M visual \cf 'clear; commandline -f repaint'
  bind -M default \cf 'clear; commandline -f repaint'
end
if set -q SSH_TTY
  set -g fish_color_host brred
end

# function fish_greeting
# 	sh $(find $FISH_CONFIG/colorscripts -type f | shuf -n1)
# end

set -U fish_greeting

alias vim "nvim"
alias vi "nvim"
alias nv "nvim"
alias v "nvim"
alias nvim "nvim"
alias c "cd"
abbr ed "echo you need help"
abbr ls "l"
alias l "lsd -lA --config-file ~/.config/lsd/config.yml"
alias lsc "ls --color=auto"
alias dc "sl"
abbr cp "cp -ivr"
abbr scp "scp -r"
abbr rm "rm -vI"
abbr mv "mv -iv"
abbr doas "sudo"
alias tree "tree -C"
abbr mkdir "mkdir -p"
alias grep "grep --color=auto"
alias diff "diff --color=auto"
alias ip "ip --color=auto"
alias wget "wget --hsts-file='$XDG_DATA_HOME/wget-hsts'"
alias upgrade "brew upgrade --casks --greedy; brew upgrade; brew cu --all; brew bundle --file ~/.config/homebrew/Brewfile"
alias colorscript 'sh $(find $FISH_CONFIG/colorscripts -type f | shuf -n1)'
alias p "cd $DEV/projects"

# path
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x XDG_STATE_HOME "$HOME/.cache/state"
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDH_BIN_HOME "$HOME/.local/bin"

# global
set -x FISH_CONFIG "$XDG_CONFIG_HOME/fish/"
set -x EDITOR "neovim"
set -x TERMINAL "alacritty"
set -x TERM "xterm-256color"
set -x TLDR_OS "macos"

# zsh
set -x HISTFILE $CACHE/bash_history
set -x HISTCONTROL ignoreboth
set -x LESSHISTFILE "-"

# programs
set -x HOMEBREW_PREFIX "/opt/homebrew"
set -x HOMEBREW_NO_ANALYTICS 1
set -x HOMEBREW_NO_INSECURE_REDIRECT 1
set -x JAVA_HOME $(/usr/libexec/java_home -v 17.0.7)
set -x JAVA_PREFIX $(/usr/libexec/java_home -v 17.0.7)
set -x GRADLE_USER_HOME "$XDG_DATA_HOME"/gradle
fish_add_path $HOMEBREW_PREFIX
fish_add_path $HOMEBREW_PREFIX/sbin
fish_add_path $HOMEBREW_PREFIX/opt/openssl@3/bin
fish_add_path $JAVA_HOME/bin
fish_vi_key_bindings

# dev
fish_add_path $XDH_BIN_HOME 
fish_add_path $XDG_DATA_HOME/npm/bin
set -x NPM_CONFIG_PREFIX "$XDG_DATA_HOME/npm"
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/config"
set -x RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -x CARGO_HOME "$XDG_DATA_HOME/cargo"
set -x PATH "$CARGO_HOME/bin:$PATH"
set -x GOPATH "$XDG_DATA_HOME"/go
set -x PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc
set -x ANDROID_HOME "$XDG_DATA_HOME"/android
set -x ANDROID_SDK_HOME "$XDG_CONFIG_HOME/android"
set -x DEV "$HOME/Development"
set -x MINECRAFT_DEV "$DEV/projects/minecraft/"
set -x DEVKIT "$DEV/kit"

mkdir -p "$XDG_DATA_HOME/rustup"
mkdir -p "$XDG_CONFIG_HOME/android"
mkdir -p "$XDG_DATA_HOME/cargo"

direnv hook fish | source

# openssl
set -x OPENSSL_PREFIX "openssl@3.1"
fish_add_path $HOMEBREW_PREFIX/opt/$OPENSSL_PREFIX/bin
set -x LDFLAGS "-L/$HOMEBREW_PREFIX/opt/$OPENSSL_PREFIX/lib"
set -x CPPFLAGS "-I/$HOMEBREW_PREFIX/opt/$OPENSSL_PREFIX/include"
set -x PKG_CONFIG_PATH "$HOMEBREW_PREFIX/opt/$OPENSSL_PREFIX/lib/pkgconfig"

# random plugin stuff
set -U __done_notify_sound 1

set --export FZF_DEFAULT_OPTS '--bind=ctrl-p:toggle-preview' '--layout=reverse'
# the only way I could get this working properly, fml
set fzf_directory_opts '--bind=enter:become(cd {} && $SHELL)' '--preview-window=hidden'

# prompt
set -x fish_color_cwd "green"
function fish_prompt -d "Write out the prompt"
  printf '%s%s%s\n%s🍺 ' \
    (set_color $fish_color_cwd) (prompt_pwd) (set_color "red"; fish_git_prompt) (set_color normal)
end

function __add_newline_after_command --on-event fish_postexec
	if test "$argv[1]" != "clear"
		printf "\n"
	end
end

function fish_mode_prompt; end;

# lunarvim
set -x LUNARVIM_RUNTIME_DIR $HOME/.local/share/lunarvim
set -x LUNARVIM_CONFIG_DIR $HOME/.config/lvim
set -x LUNARVIM_CACHE_DIR $HOME/.cache/lvim
set -x LUNARVIM_BASE_DIR $HOME/.local/share/lunarvim/lvim
