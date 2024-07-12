#!/bin/bash

# @Author Dudu-Passoni

source_dir=$1
backup_dir=$2

if [ -z "$source_dir" ] && [ -z "$backup_dir" ]; then
        echo "Digite o caminho do arquivo/diretório para backup"
        read source_dir

        echo "Digite o caminho para o arquivo backup"
        read backup_dir
fi

timestamp=$(date +%Y%m%d)
filename=$(basename "$source_dir")

backup_file="backup_${filename%.*}-$timestamp.tar.gz"

tar -czvf "$backup_dir/$backup_file" "$source_dir"
