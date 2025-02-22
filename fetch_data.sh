#!/bin/bash
urle () { [[ "${1}" ]] || return 1; local LANG=C i x; for (( i = 0; i < ${#1}; i++ )); do x="${1:i:1}"; [[ "${x}" == [a-zA-Z0-9.~-] ]] && echo -n "${x}" || printf '%%%02X' "'${x}"; done; echo; }

cd DECA

# Fetch FLAME data
if [ ! -f "./data/generic_model.pkl" ]; then
    echo -e "\nBefore you continue, you must register at https://flame.is.tue.mpg.de/ and agree to the FLAME license terms."
    read -p "Username (FLAME):" username
    read -p "Password (FLAME):" password
    username=$(urle $username)
    password=$(urle $password)

    mkdir -p ./data

    echo -e "\nDownloading FLAME..."
    wget --post-data "username=$username&password=$password" 'https://download.is.tue.mpg.de/download.php?domain=flame&sfile=FLAME2020.zip&resume=1' -O './data/FLAME2020.zip' --no-check-certificate --continue
    unzip ./data/FLAME2020.zip -d ./data/FLAME2020
    mv ./data/FLAME2020/generic_model.pkl ./data
    # rm -rf ./models
else
    echo -e "\nFLAME data already exists, skipping download..."
fi

echo -e "\nDownloading deca_model..."


if [ ! -f "./data/deca_model.tar" ]; then
    echo -e "\n开始下载 DECA 模型..."
    ../dl_deca.sh
else
    echo -e "\nDECA 模型已存在，跳过下载..."
fi


