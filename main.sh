#!/bin/bash

MAX_DIR_KB_SIZE=$((5*1000*1000))
STORAGE=/mnt/AsusRouter/camera/home

STORAGE_KB_SIZE=$(du -s $STORAGE |awk '{print $1}')

[ $STORAGE_KB_SIZE -lt $MAX_DIR_KB_SIZE ] && exit 0
SIZE_TO_DELETE=$((($STORAGE_KB_SIZE - $MAX_DIR_KB_SIZE)*1024))
CURRENT_SIZE_TO_DELETE=$SIZE_TO_DELETE

find $STORAGE -type f -printf "%T+ %p %s\n" |sort |while IFS= read -r LINE ; do
    CURRENT_FILE_NAME=$(echo $LINE |awk '{print $2}')
    rm $CURRENT_FILE_NAME
    CURRENT_FILE_SIZE=$(echo $LINE |awk '{print $3}')
    CURRENT_SIZE_TO_DELETE=$(($CURRENT_SIZE_TO_DELETE - $CURRENT_FILE_SIZE))
    [ $CURRENT_SIZE_TO_DELETE -le 0 ] && break
done