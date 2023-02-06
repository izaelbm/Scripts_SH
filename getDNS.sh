#!/bin/bash

#modo de uso ./getDNS.sh google.com

#consultando servidores DNS
echo "Scaneando Dominio"
host $1
echo " "
echo " "
echo "Consultando Servidores NS - Name Servers"
host -t ns $1
echo " "
echo "Consultando Servidores de EMAIL"
host -t mx $1
echo " "
echo "Consultando HINFO - Host Information"
host -t hinfo $1
echo " "
echo "Consultando A - IPV4"
host -t A $1
echo " "
echo "Consultando AAAA - IPV6"
host -t AAAA $1
echo " "
echo "Consultando SOA - Registro Principal"
host -t SOA $1
echo " "
echo "Consultando CNAME - Alias"
host -t CNAME $1
echo " "
echo "Consultando PTR - Zona Reversa"
host -t PTR $1

