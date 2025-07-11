#!/bin/zsh


createSymLink() {
  local linkPath="$2"
  local targetPath="$1"
  local NAME=""


  for key value in ${(kv)apps}; do
    if [[ $value == "$targetPath:$linkPath" ]]; then
      NAME=$key
    fi
  done


  if [ -L "$linkPath" ]; then
    gum log -sl error "Symlink already exists for $NAME"
  else
    ln -s "$targetPath" "$linkPath"
    gum log -sl info "Symlink created for $NAME"
  fi
}

deleteSymLink() {
  local TARGET="$1"
  local NAME=""

  for key value in ${(kv)apps}; do
    if [[ $value == *"$TARGET"* ]]; then
      NAME=$key
    fi
  done

  if [ -L "$TARGET" ]; then
    rm -r "$TARGET"
    gum log -sl info "Deleting SymLink for $NAME"
  else
    gum log -sl error "Not a SymLink: $TARGET"
  fi
}

dotFiles="$HOME/dotFiles"
dotConfig="$dotFiles/dot_config"
dest_dotConfig="$HOME/.config"

typeset -A apps



## HOME DIR
apps[zshrc]="$dotFiles/.zshrc:$HOME/.zshrc"
apps[tmux]="$dotFiles/.tmux.conf:$HOME/.tmux.conf"
apps[tmux_Dir]="$dotFiles/.tmux:$HOME/.tmux"
apps[wezterm]="$dotFiles/.wezterm.lua:$HOME/.wezterm.lua"
apps[dialogrc]="$dotFiles/.dialogrc:$HOME/.dialogrc"

## dot_config
apps[alacritty]="$dotConfig/alacritty:$dest_dotConfig/alacritty"
apps[nvim]="$dotConfig/nvim:$dest_dotConfig/nvim"
apps[yazi]="$dotConfig/yazi:$dest_dotConfig/yazi"
apps[bat]="$dotConfig/bat:$dest_dotConfig/bat"
apps[hyprland]="$dotConfig/hypr:$dest_dotConfig/hypr"
apps[waybar]="$dotConfig/waybar:$dest_dotConfig/waybar"
apps[kitty]="$dotConfig/kitty:$dest_dotConfig/kitty"
apps[wofi]="$dotConfig/wofi:$dest_dotConfig/wofi"

## OTHER
apps[wallpapers]="$dotFiles/wallpaper:$dest_dotConfig/wallpaper"


appList=(${(ko)apps})


modes=("install" "uninstall")
mode=$(printf "%s\n" "${modes[@]}" | gum choose)



selectedApps=$(printf "%s\n" "${appList[@]}" | gum choose --no-limit)

echo 
gum style --margin "0 2" --foreground 212 --align center "Selected Apps"

gum style \
	--foreground 212 --border-foreground 212 --border double \
	--align center --width 15 --margin "0.5 1" \
 "$selectedApps" 


if [[ $mode == "install" ]]; then
  gum confirm "Installing these configs. Confirm?" || { echo "Exiting..."; exit 1; }
elif [[ $mode == "uninstall" ]]; then
  gum confirm "Uninstalling these configs. Confirm?" || { echo "Exiting..."; exit 1; }
fi

echo "$selectedApps" | while read -r app; do
  [[ -z "$app" ]] && continue


  IFS=':' read -r path1 path2 <<< "${apps[$app]}"


  if [[ $mode == "install" ]]; then
    createSymLink $path1 $path2 
  elif [[ $mode == "uninstall" ]]; then
    deleteSymLink $path2 
  fi
done
