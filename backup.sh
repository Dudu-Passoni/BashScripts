#!/bin/bash

# @Author Dudu-Passoni

source_dir=$1
backup_dir=$2

if [[ "$1" == "-h" ]]; then
        echo "backup [source directory] [backup directory]"
else

if [[ -z "$source_dir" ]] && [[ -z "$backup_dir" ]]; then
        echo "Please, specify the directory/file path:"
        read source_dir

        echo "Please, specify the path you want your backup:"
        read backup_dir
fi

timestamp=$(date +%Y%m%d)
filename=$(basename "$source_dir")

backup_file="backup_${filename%.*}-$timestamp.tar.gz"

tar -czvf "$backup_dir/$backup_file" "$source_dir"

echo "Sucess..."

fi

