#!/bin/bash

from="factor: 1"
to="factor: 0"

if [ "$1" == "-r" ]; then
    echo "REVERSE"
else
    echo "STRAIGHT"
fi

files=(
    "/usr/share/sddm/themes/breeze/components/WallpaperFader.qml"
    "/usr/share/plasma/look-and-feel/org.kde.breeze.desktop/contents/components/WallpaperFader.qml"
)

for fname in ${files[@]}; do
    if [ "$1" == "-r" ]; then
        sudo sed -i.back '117 s/${to}/${from}/' $fname
    else
        sudo sed -i.back '117 s/${from}/${to}/' $fname
    fi
done
