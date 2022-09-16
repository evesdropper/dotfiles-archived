#!/bin/bash

# couple lines of code to take screenshots and save with a file name.
screenshot_dir="$HOME/Pictures/Screenshots/"
fileout="$screenshot_dir/$(zenity --entry --title="Take a Screenshot" --text="Image Name:").png"
[ -d "$screenshot_dir" ]; grim -g "$(slurp)" $fileout
wl-copy < $fileout
