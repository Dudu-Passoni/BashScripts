#!/bin/bash

# @Author Luis Eduardo Passoni


_autocomplete() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(compgen -f -- "$cur"))
}


compress(){
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
}

decompress(){

file_path=$1

complete -F _autocomplete "$0"

if [[ -z "$file_path" ]]; then
	echo "Specify the path to the file you want to decompress:"
	read -e file_path
fi
	file_path="${file_path/#\~/$HOME}"
	

	tar -xvzf "$file_path"
	echo "File successfully extracted"
	echo "Bye..."


}

GREEN_LIGHT="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# Exibindo a logo em verde claro
echo -e "${GREEN_LIGHT} ____"
echo -e "|  _ \\ _ __ ___  ___ ___ "
echo -e "| |_) | '__/ _ \\ / __/ __|"
echo -e "|  __/| | |  __/\\__ \\__ \\"
echo -e "|_|   |_|  \\___||___/___/"
echo -e "Compression and decompression bash script${RESET}"

echo ""
echo -e "Written by ${YELLOW}Luis Eduardo Passoni${RESET}"
echo ""

echo "What you want to do? Compress, extract or list? [c/e/l]"
read user_option

if [[ $user_option = "c" ]];then
	compress
elif [[ $user_option = "e" ]]; then
	decompress
elif [[ $user_option = "l" ]]; then
	echo "not implemented yet"
#	 not implemented yet 
	list
else
	echo "Option not found"
	echo "Bye..."
	exit 1
fi


