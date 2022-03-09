#!/bin/bash
# https://stackoverflow.com/questions/11316986/how-to-convert-iso8859-15-to-utf8/36619843#36619843
# Liu Gui
# https://stackoverflow.com/users/5557705/li-gui

for i in `iconv -l`
do
   echo $i
   iconv -f $i -t UTF-8 yourfile | grep "hint to tell converted success or not"
done &>/tmp/converted
