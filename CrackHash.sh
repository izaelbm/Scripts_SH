#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

hashMaster=$1
wordList=$2

header="=======================================\n"
header="${header}# CreckHash / By izaelbm     #\n"
header="${header}# ./CheckHash.sh hash wordlist #\n"
header="${header}# Script para comparar hashes        #\n"
header="${header}=======================================\n"

info="${GREEN}[+]${NC} Igual / ${RED}[-]${NC} Diferente"

code="[Executando $1 $2]"

lines=$(wc -l $2 | cut -d " " -f1)

#exibindo o Header
echo -e $header
echo -e $code
echo " "
echo -e "$lines Palavras Encontradas na Wordlist"
echo " "
echo "Iniciando o BruteForce...."
echo " "

#percorrendo a wordlist
for i in $(cat $wordList);
do
	#round  MD5
	roundMd5=$(echo -n $i | md5sum | cut -d " " -f1)

	#round base64
	roundB64=$(echo -n $roundMd5 | base64 | cut -d " " -f1)

	#round SHA1
	roundSha1=$(echo -n $roundB64 | sha1sum | cut -d " " -f1)

	clear
        #exibindo o Header
        echo -e $header
        echo -e $code
        echo " "
        echo -e "$lines Itens Encontrados na Wordlist"
        echo " "

	if [ $hashMaster == $roundSha1  ];
	then
		echo "Senha Encontrada"
		echo " "
		echo -e "${GREEN}[+] ${NC}$hashMaster ==> ${GREEN} $i ${NC}"
		exit 0
	else
		echo -e "${RED}[-] ${NC}$hashMaster ==> ${RED} $i | $roundSha1 ${NC}"
	fi
done
