#!/bin/sh

ls *.wiki | while read line
do
    if ! grep -q $line session_?.wiki ; then
        echo $line
    fi
done
