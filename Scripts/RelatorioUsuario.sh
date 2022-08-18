#!/bin/bash

#########################################################################
#                                                                       #
# RelatorioMaquina.sh - Relatório do usuário                            #
#                                                                       #
# Autor: Igor Pestana (igorspestana@gmail.com)                          #
# Data Criação: 09/07/2022                                              #
#                                                                       #
# Descrição: Script que gera um relatório de algumas informações        #
#            da usuáro                                                  #
#                                                                       #
# Exemplo de uso: ./RelatorioUsuario.sh <usuario>                       #
#                                                                       #
#########################################################################


#Validação do usuário
ls /home/$1 > /dev/null 2>&1 || { echo "Usuário Inexistente" ; exit 1; }


#Declaração das variáveis
USERID=$(grep $1 /etc/passwd | cut -d":" -f3)
NOMECOMPLETO=$(grep $1 /etc/passwd | cut -d":" -f5 | tr -d ,)
HOME=$(grep $1 /etc/passwd | cut -d":" -f6)
TOTALUSO=$(du -sh /home/$1 | cut -f1)

clear
echo "============================================================="
echo "Relatório do Usuário: $1"
echo "UID: $USERID"
echo "Nome ou Descrição: $NOMECOMPLETO"
echo "Total Usado no $HOME: $TOTALUSO"
echo "Último Login:"
lastlog -u $1
echo "============================================================="
exit 0