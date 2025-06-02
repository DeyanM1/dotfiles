#!/bin/bash


delete_symlink() {
  local TARGET="$1"

  if [ -L "$TARGET" ]; then
    echo "Deleting symbolic link: $TARGET"
    rm "$TARGET"
  else
    echo "Not a symbolic link: $TARGET"
  fi
}

## Home Dir
delete_symlink "$HOME/.zshrc"
delete_symlink "$HOME/.tmux.conf"
delete_symlink "$HOME/.wezterm.lua"
delete_symlink "$HOME/.tmux"

## .config
delete_symlink "$HOME/.config/alacritty"
delete_symlink "$HOME/.config/nvim"
delete_symlink "$HOME/.config/yazi"
delete_symlink "$HOME/.config/bat"
delete_symlink "$HOME/.config/waybar"
