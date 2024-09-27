#!/bin/bash

# @Author Luis Eduardo Passoni

echo "Compress your files or directory."
echo -e "\e[1;33mWritten by Luis Eduardo Passoni\e[0m"

_autocomplete() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(compgen -f -- "$cur"))
}

source_dir=$1
backup_dir=$2


complete -F _autocomplete "$0"

if [[ "$1" == "-h" ]]; then
    echo "Usage: Compress [source directory] [backup directory]"
else

    if [[ -z "$source_dir" ]] && [[ -z "$backup_dir" ]]; then
        echo "Specify the path to the file/diretory you want to compress:"
        read -e source_dir

        echo "Specify the path to where the backup file is gonna go:"
        read -e backup_dir
    fi

	source_dir="${source_dir/#\~/$HOME}"
	backup_dir="${backup_dir/#\~/$HOME}"

    timestamp=$(date +%Y%m%d)
    filename=$(basename "$source_dir")

    backup_file="backup_${filename%.*}-$timestamp.tar.gz"

    tar -czvf "$backup_dir/$backup_file" "$source_dir"

    echo "Compression done successfully"
    echo "Bye..."
fi

