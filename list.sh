#!/bin/bash
list=($(ls -t *.sh))
echo "$(ls *.txt |wc -l )"
echo "${list[@]}"
a=${list[@]:3}
echo $a
