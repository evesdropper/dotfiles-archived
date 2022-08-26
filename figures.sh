#!/bin/bash

# discor

# stuff 
if [ "$1" == "-s" -o "$1" == "-setdir" ]; then
    new_dir=$(pwd)
    #unlink ~/Documents/university/fdir/
    ln -sf $new_dir ~/Documents/university/fdir
else
    screenshot_dir="$HOME/Documents/university/fdir"
    figures_dir="$screenshot_dir/figures"
    fileout="$figures_dir/$(date +'%Y-%m-%d_%H-%M-%S')" # may change depending on me getting yaml or something to organize stuff
    [ -d "$figures_dir" ] || mkdir figures_dir
    [ -d "$figures_dir" ]; /usr/bin/gnome-screenshot -c -a -f "$fileout" $@
fi
