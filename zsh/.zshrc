# ZSH Configuration — Fedora/Sway/Ghostty

# ── History ─────────────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# ── Completion ──────────────────────────────────
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select

# ── Vi keybindings ──────────────────────────────
bindkey -v
bindkey '^R' history-incremental-search-backward

# ── Environment ─────────────────────────────────
export EDITOR=vim
export LANG=en_US.UTF-8
export TERM=xterm-256color

# ── Prompt ──────────────────────────────────────
PROMPT='%F{blue}%n%f:%F{cyan}%~%f $ '
RPROMPT='%F{gray}%T%f'

# ── Plugins ─────────────────────────────────────
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && \
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && \
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

# ── Tools ───────────────────────────────────────
eval "$(zoxide init zsh)"

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='--color=fg:#cdd6f4,bg:#11111b,hl:#89b4fa,fg+:#cdd6f4,bg+:#313244,hl+:#89b4fa,info:#cba6f7,prompt:#cba6f7,pointer:#cba6f7,marker:#a6e3a1,spinner:#94e2d5,header:#89b4fa'

alias ls='eza --icons'
alias la='eza -la --icons'
alias ll='eza -l --icons'
alias tree='eza --tree --icons'
alias cat='bat'
