#!/bin/bash

#=========================================================================
#                                                                       
# ListaUsuario.sh  - Script que lista os usuários humanos
#                                                                       
# Autor: Igor Pestana (igorspestana@gmail.com)
# Data Criação: 15/07/2022
#                                                                       
# Descrição: Script que lista todos os usuários humanos do sistema
#            exibindo as principais informações da conta                                     
#                                                                       
# Exemplo de uso: ./ListaUsuario.sh                               
#                                                                       
#=========================================================================

#UIDs utilizados para usuários comuns
UIDMIN=$(cat /etc/login.defs | grep ^UID_MIN | tr -s "\t" | cut -d" " -f2)
UIDMAX=$(cat /etc/login.defs | grep ^UID_MAX | tr -s "\t" | cut -f2)


#Adicionando quebra de linha como separador de campo
OLDIFS=$IFS
IFS=$'\n'


#Cabeçalho de saída
echo -e "USUARIO\t\tUID\t\tDIR HOME\t\tNOME OU DESCRIÇÃO"

for i in $(cat /etc/passwd)
do
	USER=$(echo $i | cut -d":" -f1)
	USERID=$(echo $i | cut -d":" -f3)
	DIRHOME=$(echo $i | cut -d":" -f6)
	USERDESC=$(echo $i | cut -d":" -f5)

	if [ $USERID -ge $UIDMIN -a $USERID -le $UIDMAX ]
	then
		echo -e "$USER\t\t$USERID\t\t$DIRHOME\t\t$USERDESC"
	fi
done

#Retornando o IFS como padrão
IFS=$OLDIFS