#!/bin/bash
# This script zips a directory so it can be uploaded as a Shopify theme
#  while zipping the directory it excludes hidden directories and a couple other file types

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

if [[ -z $1 ]]; then
  echo "Usage: shopify_theme_builder /your-directory/ theme-name"
else
  directory=$1
  theme="$2.zip"
  zip -r "$theme" "$directory" ./ -x "*/\.*" -x "\.*" -x "*.zip" -x "*.csv" -x "*.rb" -x "*.bak" -x "*.swp" -x "*.back" -x "*.merge" -x "*.txt" -x "*.sh"

  echo "Your Shopify theme $theme is ready to be uploaded."
fi 
