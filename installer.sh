#!/bin/zsh


createSymLink() {
  local linkPath="$2"
  local targetPath="$1"

  if [ -L "$linkPath" ]; then
    echo "Symlink already exists at $linkPath"
  else
    ln -s "$targetPath" "$linkPath"
    echo "Symlink created: $linkPath → $targetPath"
  fi
}


## Home Dir
createSymLink $HOME/dotFiles/.zshrc $HOME/.zshrc
createSymLink $HOME/dotFiles/.tmux.conf $HOME/.tmux.conf
createSymLink $HOME/dotFiles/.wezterm.lua $HOME/.wezterm.lua
createSymLink $HOME/dotFiles/.tmux $HOME/.tmux

## dot_config
createSymLink $HOME/dotFiles/dot_config/alacritty $HOME/.config/alacritty
createSymLink $HOME/dotFiles/dot_config/nvim $HOME/.config/nvim
createSymLink $HOME/dotFiles/dot_config/yazi $HOME/.config/yazi
createSymLink $HOME/dotFiles/dot_config/bat $HOME/.config/bat
createSymLink $HOME/dotFiles/dot_config/hypr $HOME/.config/hypr
createSymLink $HOME/dotFiles/dot_config/waybar $HOME/.config/waybar
createSymLink $HOME/dotFiles/dot_config/kitty $HOME/.config/kitty
createSymLink $HOME/dotFiles/dot_config/wofi $HOME/.config/wofi

## OTHER
createSymLink $HOME/dotFiles/wallpaper $HOME/.config/wallpaper
