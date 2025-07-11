#!/bin/zsh

typeset -A appMeta

appMeta[VSCode_description]="Code Editor"
appMeta[VSCode_command]="echo Installing VSCode..."

appMeta[Docker_description]="Container Engine"
appMeta[Docker_command]="echo Installing Docker..."

appMeta[Python_description]="Programming Language"
appMeta[Python_command]="echo Installing Python..."

choices=("VSCode" "Docker" "Python")
selectedApps=$(printf "%s\n" "${choices[@]}" | gum choose --no-limit)

# Read selected apps line by line
echo "$selectedApps" | while read -r app; do
  [[ -z "$app" ]] && continue
  echo "\n==> ${appMeta[${app}_description]}"
  eval ${appMeta[${app}_command]}
done

