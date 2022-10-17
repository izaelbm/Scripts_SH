 #!/bin/bash

echo "" > whois_log.txt

mode="Modo de Uso: ./whois.sh list.txt"

#Definindo Variaveis
lista=$1

for i in $(cat $lista)
do

result=$(whois $i | grep "Organization:" | cut -d ":" -f 2 | sed 's/ //g')

count=${#result}

if [ $count -le 0 ]; then 
        echo $i";Other"
else
        echo $i";"$result
fi

sleep 1

done
