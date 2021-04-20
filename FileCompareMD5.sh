#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

header="=======================================\n"
header="${header}# ChecksumMD5_Compare / By izaelbm     #\n"
header="${header}# ./CheckMD5.sh file fileMaster fileCompare #\n"
header="${header}# arg '/:file' Compare one File        #\n"
header="${header}# arg '/:dir' Compare All Files Dir        #\n"
header="${header}# Script para comparar arquivos        #\n"
header="${header}=======================================\n"

info="${GREEN}[+]${NC} Igual / ${RED}[-]${NC} Diferente"

code="[Executando $1 $2 $3]"

master="Master File ==> $2 MD5[$(md5sum $2 | cut -d " " -f1)]"

#Exibindo o Header
echo -e $header

echo -e $code

#Verificando se os argumentos estao vazios
#if [["$1" == ""] || ["$2" == ""] || ["$3" == ""]];
#then
#	clear
#	echo " "
#	echo "*** Ta Faltando alguns argumentos ai....***"
#	echo " "
#	echo -e $header
 #   exit 1
#fi

#cria um hash md5 do arquivo mestre
FileMaster=$(md5sum $2 | cut -d " " -f1)

#valida se iremos comparar com somente 1 arquivo ou com varios
if [[ $1 == "/:file" ]];
then
	#cria um hash md5 do arquivo a ser comparado
        FileCompare=$(md5sum $3 | cut -d " " -f1)
	
	clear
	echo -e $header
	echo -e $Code
	echo " "

	echo -e $master
        echo " "
        echo "Comparando os arquivos........"
        echo " "
        echo -e "${info}"
        echo " "

        #valida se os arquivos sao iguais
        if [ $FileMaster == $FileCompare ];
        then
                echo -e "${GREEN}[+] ${NC}$a $FileCompare"

        else
	        echo -e "${RED}[-] ${NC}$a $FileCompare"
        fi
else
	#comparando com varios arquivos
	clear

        echo -e $header
	echo -e $code
	echo " "
	echo -e $master
        echo " "
        echo "Comparando os arquivos........"
        echo " "
	echo -e "${info}"
	echo " "

	for a in $(ls $3);
	do
		FileCompare=$(md5sum $a | cut -d " " -f1)

		#valida se os arquivos sao iguais
                if [ $FileMaster == $FileCompare ]
                then
                        echo -e "${GREEN}[+] ${NC}$a $FileCompare"
                else
                        echo -e "${RED}[-] ${NC}$a $FileCompare"
                fi

	done
fi
