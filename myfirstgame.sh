#!/bin/sh
echo -ne '\033c\033]0;myfirstgame\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/myfirstgame.x86_64" "$@"
