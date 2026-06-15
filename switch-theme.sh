#!/bin/bash
DOTFILES="$HOME/dotfiles"
THEME=$1

if [ -z "$THEME" ]; then
  echo "Usage: $0 <theme-name>"
  echo "Available themes:"
  ls "$DOTFILES/themes/"
  exit 1
fi

if [ ! -d "$DOTFILES/themes/$THEME" ]; then
  echo "Theme '$THEME' not found!"
  ls "$DOTFILES/themes/"
  exit 1
fi

echo "Switching to theme: $THEME"

# Unstow semua theme lama
for theme in "$DOTFILES/themes"/*/; do
  theme_name=$(basename "$theme")
  stow -D "$theme_name" -d "$DOTFILES/themes" -t ~ 2>/dev/null
done

# Stow theme baru
stow "$THEME" -d "$DOTFILES/themes" -t ~

# Reload
pkill waybar; waybar &
pkill dunst; dunst &
swaymsg reload

echo "Done! Theme: $THEME"
