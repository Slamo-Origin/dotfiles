# Bash configuration

# Catppuccin Mocha Colors
PURPLE='\[\033[1;35m\]'
BLUE='\[\033[1;34m\]'
GREEN='\[\033[1;32m\]'
PINK='\[\033[1;95m\]'
RESET='\[\033[0m\]'

# Custom PS1 with Arch logo
PS1="${PURPLE}󰣇 ${BLUE}\w${GREEN}\$(git branch 2>/dev/null | grep '*' | sed 's/* / /')${RESET} ${PINK}➜${RESET} "

# Aliases
alias rice='clear && fastfetch'
alias fetch='fastfetch'
alias ls='ls --color=auto'
alias ll='ls -lah'

# Starship (if installed)
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# ╔══════════════════════════════════════════════════════════╗
# ║  Bash Configuration - Catppuccin Mocha Rice             ║
# ╚══════════════════════════════════════════════════════════╝

# Starship prompt
eval "$(starship init bash)"

# Aliases
alias rice='clear && fastfetch'
alias fetch='fastfetch'
alias ls='ls --color=auto'
alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias cat='bat --theme=catppuccin-mocha' 2>/dev/null || cat

# Git shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'

# Hyprland shortcuts
alias hypr-reload='hyprctl reload'
alias hypr-edit='$EDITOR ~/.config/hypr/hyprland.conf'
export STARSHIP_CONFIG=~/.config/starship/starship.toml
