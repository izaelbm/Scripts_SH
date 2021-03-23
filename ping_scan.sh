#Script para realizar um scaneamento ICMP (ping) para identificar hosts ativos na rede
#By Izael Magalhaes
#izaelbm.com.br
#23/03/2021

#*** Conhecimento não é crime, porem o que você fara com ele é de sua responsabilidade..... ***

#!/bin/bash

header="=======================================\n"
header="${header}# Ping Scan - ICMP - By izaelbm       #\n"
header="${header}# ./ping_scan.sh 192.168.0            #\n"
header="${header}# Log salvo em log.txt                #\n"
header="${header}=======================================\n"

echo -e $header

for host in {1..254};
do
        resp=$(ping -c 1 $1.$host | grep "icmp_seq" | cut -d " " -f 4 | cut -d ":" -f 1);
        validate=${#resp}

        if [ $validate == 0 ];
        then
                log="[-] Host Inativo ==> $1.$host"
        else
                log="[+] Host Ativo ==> $resp"
        fi

        echo > " " log.txt
        echo $log >> log.txt

        clear

        percent="Escaneando $host/254..."
        echo -e $header
        echo $percent
done
