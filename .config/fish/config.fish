if status is-interactive
    # Commands to run in interactive sessions can go here
end

## ALIASES ##
alias c="claude"
alias o="opencode"
alias o="opencode --continue"

## zsh git aliases
# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

alias gst='git status'
alias gba='git branch --all'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glods='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias glod='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glola='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glols='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'

# --- Neovim ---
# Make sure we call your pinned binary first
fish_add_path -p $HOME/bin/nvim-macos-arm64/bin
# optional; PATH above is usually enough
alias nvim="$HOME/bin/nvim-macos-arm64/bin/nvim"
set -gx EDITOR nvim
set -gx VISUAL nvim

# --- Google Cloud SDK ---
fish_add_path -a /Users/dineshpandiyan/Downloads/google-cloud-sdk/bin
if test -f /Users/dineshpandiyan/Downloads/google-cloud-sdk/completion.fish.inc
    source /Users/dineshpandiyan/Downloads/google-cloud-sdk/completion.fish.inc
end

eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up fzf key bindings
fzf --fish | source

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/dineshpandiyan/Downloads/google-cloud-sdk/path.fish.inc' ]
    . '/Users/dineshpandiyan/Downloads/google-cloud-sdk/path.fish.inc'
end
fish_add_path $HOME/.local/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set -gx RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep/config"
