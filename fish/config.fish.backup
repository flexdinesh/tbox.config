if status is-interactive
    # Commands to run in interactive sessions can go here
end

## ALIASES ##
alias gst="git status"
alias gba="git branch --all"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"

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

# --- SDKMAN (bash/zsh only) ---
# Use 'bass' to source bash scripts, or install a fish wrapper.
# 1) Install fisher + bass once:
#    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
#    fisher install edc/bass
#
# 2) Then enable SDKMAN via bass:
set -gx SDKMAN_DIR $HOME/.sdkman
if type -q bass
    if test -s "$SDKMAN_DIR/bin/sdkman-init.sh"
        bass source "$SDKMAN_DIR/bin/sdkman-init.sh" ';' export SDKMAN_DIR
    end
end

eval "$(/opt/homebrew/bin/brew shellenv)"

# Set up fzf key bindings
fzf --fish | source
