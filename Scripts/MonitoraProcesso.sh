#!/bin/bash

#=========================================================================
#                                                                       
# MonitoraProcesso.sh  - Script que monitora um processo
#                                                                       
# Autor: Igor Pestana (igorspestana@gmail.com)
# Data Criação: 15/07/2022
#                                                                       
# Descrição: Script que monitora se um processo está em execução                                     
#                                                                       
# Exemplo de uso: ./MonitoraProcesso.sh                         
#                                                                       
#=========================================================================

read -p "Insira o nome do processo: " PROCESSO
TIME=2

while true
do
	if ps axu | grep $PROCESSO | grep -v grep | grep -v $0 > /dev/null 
	then
		echo "$PROCESSO em execução"
		sleep $TIME
	else
		echo "ATENÇÃO!!!!!!! O processo $PROCESSO NÃO está em execução!"
		sleep $TIME
	fi
done